# Story 3.4: Analytics Dashboard

**Epic:** EPIC-3: Self-Hosted Analytics  
**Priority:** P1 (Should Have)  
**Story Points:** 13

## User Story

**As a** blog owner  
**I want** a dashboard showing key analytics metrics  
**So that** I can understand my blog's performance

## Acceptance Criteria

### 1. Dashboard Route
- [ ] URL: `/admin/analytics`
- [ ] Controller: `Admin::AnalyticsController#index`
- [ ] Protected: `before_action :authenticate_user!`
- [ ] Simple HTML page (no JavaScript charting initially)

### 2. Metrics Displayed

#### Traffic Overview (last 30 days):
- [ ] Total page views (PV)
- [ ] Unique visitors (UV, count distinct session_id)
- [ ] Bounce rate (% sessions with only 1 page view)
- [ ] Avg session duration (calculate from Session first_seen/last_seen)

#### Popular Posts (top 10 by page views, last 30 days):
- [ ] Post title (link to post)
- [ ] Page views
- [ ] Unique visitors

#### Traffic Sources (top 10 referrers, last 30 days):
- [ ] Referrer domain
- [ ] Count of page views
- [ ] % of total traffic

#### Devices & Browsers (last 30 days):
- [ ] Device type breakdown (mobile/tablet/desktop) with percentages
- [ ] Top browsers with percentages
- [ ] Top OS with percentages

#### Geographic Distribution (if country tracking implemented):
- [ ] Top countries by sessions

#### Performance Metrics:
- [ ] Avg response time (from response_time_ms in PageView)
- [ ] 95th percentile response time

### 3. Date Range Filter
- [ ] Default: Last 30 days
- [ ] Options: Last 7 days, Last 30 days, Last 90 days, All time
- [ ] Dropdown or radio buttons to select range
- [ ] Reloads page with query param: `?range=7d`

### 4. Data Aggregation
- [ ] Use ActiveRecord queries with `group`, `count`, `sum`
- [ ] Cache aggregated metrics (use Rails fragment caching, expire daily)
- [ ] Query performance <500ms for dashboard load

### 5. Summary Table
- [ ] Create `AnalyticsSummary` model to store daily aggregates
- [ ] Fields: `date`, `total_pv`, `unique_visitors`, `bounce_rate`, `avg_duration`, `created_at`
- [ ] Nightly job (scheduled via whenever gem or manual cron) aggregates yesterday's data
- [ ] Dashboard queries summaries for fast load

### 6. Visualization
- [ ] Use plain HTML tables (simple, readable)
- [ ] Optional: Add Chart.js for line charts (PV over time)
- [ ] Keep it minimal—avoid over-engineering

## Technical Implementation

**Model:**
```ruby
# app/models/analytics_summary.rb
class AnalyticsSummary < ApplicationRecord
  validates :date, presence: true, uniqueness: true
end
```

**Migration:**
```bash
rails g model AnalyticsSummary date:date total_pv:integer unique_visitors:integer bounce_rate:float avg_duration:float
```

**Controller:**
```ruby
# app/controllers/admin/analytics_controller.rb
class Admin::AnalyticsController < ApplicationController
  before_action :authenticate_user!

  def index
    @range = params[:range] || '30d'
    @start_date = start_date_from_range(@range)
    @end_date = Date.today

    @total_pv = PageView.where('created_at >= ?', @start_date).count
    @unique_visitors = PageView.where('created_at >= ?', @start_date).distinct.count(:session_id)
    
    @popular_posts = PageView
      .where('created_at >= ?', @start_date)
      .group(:path)
      .order('count_all DESC')
      .limit(10)
      .count
    
    @traffic_sources = PageView
      .where('created_at >= ? AND referrer IS NOT NULL', @start_date)
      .group(:referrer)
      .order('count_all DESC')
      .limit(10)
      .count
    
    @device_types = Session
      .where('last_seen >= ?', @start_date)
      .group(:device_type)
      .count
    
    @browsers = Session
      .where('last_seen >= ?', @start_date)
      .group(:browser)
      .order('count_all DESC')
      .limit(10)
      .count
    
    @avg_response_time = PageView
      .where('created_at >= ?', @start_date)
      .average(:response_time_ms)
      .to_f.round(2)
    
    @p95_response_time = PageView
      .where('created_at >= ?', @start_date)
      .order(:response_time_ms)
      .offset((PageView.where('created_at >= ?', @start_date).count * 0.95).to_i)
      .limit(1)
      .pluck(:response_time_ms)
      .first || 0
  end

  private

  def start_date_from_range(range)
    case range
    when '7d' then 7.days.ago
    when '30d' then 30.days.ago
    when '90d' then 90.days.ago
    when 'all' then 100.years.ago
    else 30.days.ago
    end
  end
end
```

**Job (for nightly aggregation):**
```ruby
# app/jobs/aggregate_analytics_job.rb
class AggregateAnalyticsJob < ApplicationJob
  queue_as :default

  def perform(date = Date.yesterday)
    return if AnalyticsSummary.exists?(date: date)

    start_time = date.beginning_of_day
    end_time = date.end_of_day

    total_pv = PageView.where(created_at: start_time..end_time).count
    unique_visitors = PageView.where(created_at: start_time..end_time).distinct.count(:session_id)
    
    sessions_with_single_view = Session
      .where(first_seen: start_time..end_time)
      .select { |s| PageView.where(session_id: s.session_id).count == 1 }
      .count
    
    total_sessions = Session.where(first_seen: start_time..end_time).count
    bounce_rate = total_sessions > 0 ? (sessions_with_single_view.to_f / total_sessions * 100).round(2) : 0

    avg_duration = Session
      .where(first_seen: start_time..end_time)
      .where('last_seen > first_seen')
      .average('CAST((julianday(last_seen) - julianday(first_seen)) * 86400 AS INTEGER)')
      .to_f.round(2)

    AnalyticsSummary.create!(
      date: date,
      total_pv: total_pv,
      unique_visitors: unique_visitors,
      bounce_rate: bounce_rate,
      avg_duration: avg_duration
    )
  end
end
```

**View (simplified):**
```erb
<!-- app/views/admin/analytics/index.html.erb -->
<h1>Analytics Dashboard</h1>

<div>
  <%= link_to "Last 7 Days", admin_analytics_path(range: '7d') %>
  <%= link_to "Last 30 Days", admin_analytics_path(range: '30d') %>
  <%= link_to "Last 90 Days", admin_analytics_path(range: '90d') %>
  <%= link_to "All Time", admin_analytics_path(range: 'all') %>
</div>

<h2>Traffic Overview</h2>
<table>
  <tr><td>Total Page Views:</td><td><%= @total_pv %></td></tr>
  <tr><td>Unique Visitors:</td><td><%= @unique_visitors %></td></tr>
  <tr><td>Avg Response Time:</td><td><%= @avg_response_time %>ms</td></tr>
  <tr><td>95th Percentile:</td><td><%= @p95_response_time %>ms</td></tr>
</table>

<h2>Popular Posts</h2>
<table>
  <% @popular_posts.each do |path, count| %>
    <tr>
      <td><%= link_to path, path %></td>
      <td><%= count %> views</td>
    </tr>
  <% end %>
</table>

<!-- Add more sections for traffic sources, devices, etc. -->
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Controller tests verify metric calculations
- [ ] Queries optimized with indexes
- [ ] Manual testing with sample data (100+ page views)
- [ ] Dashboard loads in <1s
- [ ] Documentation for dashboard usage

## Dependencies

- [Story 3.1: Analytics Data Models](./story-3.1-analytics-models.md)
- [Story 3.2: Page View Tracking](./story-3.2-pageview-tracking.md)

## Related Stories

- [Story 4.4: Performance Monitoring](../epic-4-performance/story-4.4-monitoring.md)
