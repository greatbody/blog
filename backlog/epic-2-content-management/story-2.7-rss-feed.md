# Story 2.7: RSS Feed

**Epic:** EPIC-2: Content Management  
**Priority:** P2 (Nice to Have)  
**Story Points:** 3

## User Story

**As a** blog reader  
**I want** an RSS feed  
**So that** I can subscribe and get updates on new posts

## Acceptance Criteria

### 1. RSS Endpoint
- [ ] URL: `/feed.xml` or `/rss.xml`
- [ ] Routes to `home#feed`
- [ ] Returns XML with content-type `application/rss+xml`

### 2. Feed Content
- [ ] RSS 2.0 format
- [ ] Channel title: Blog name
- [ ] Channel description: Brief blog description
- [ ] Channel link: Root URL
- [ ] Items: All published posts (limit 50 most recent)

### 3. Item Fields
- [ ] Title: Post title
- [ ] Link: Full URL to post
- [ ] Description: First 500 characters of content (plain text or HTML)
- [ ] pubDate: Published date in RFC 822 format
- [ ] guid: Post slug (unique identifier)

### 4. Implementation
- [ ] Use Rails' `builder` template (`feed.xml.builder`)
- [ ] Or use `rss` gem if simpler
- [ ] No external dependencies beyond standard gems

## Technical Implementation

**Routes:**
```ruby
get '/feed.xml', to: 'home#feed', defaults: { format: 'xml' }
```

**Controller:**
```ruby
# app/controllers/home_controller.rb
def feed
  @posts = Post.published.order(published_at: :desc).limit(50)
  respond_to do |format|
    format.xml
  end
end
```

**View:**
```ruby
# app/views/home/feed.xml.builder
xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "My Technical Blog"
    xml.description "Programming articles and tutorials"
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link post_url(post)
        xml.description truncate(strip_tags(markdown(post.content)), length: 500)
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.guid post_url(post), isPermaLink: "true"
      end
    end
  end
end
```

## Example Output

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>My Technical Blog</title>
    <description>Programming articles and tutorials</description>
    <link>https://myblog.com/</link>
    <item>
      <title>Getting Started with Rails</title>
      <link>https://myblog.com/posts/getting-started-with-rails</link>
      <description>In this post, we'll explore how to build...</description>
      <pubDate>Sat, 26 Oct 2025 12:00:00 +0000</pubDate>
      <guid isPermaLink="true">https://myblog.com/posts/getting-started-with-rails</guid>
    </item>
  </channel>
</rss>
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Feed validates at https://validator.w3.org/feed/
- [ ] Tested in RSS reader (e.g., Feedly, NetNewsWire)
- [ ] Documentation in README
- [ ] Link to feed added to homepage footer

## Dependencies

- [Story 2.6: Public Homepage](./story-2.6-public-homepage.md)

## Related Stories

- [Story 2.6: Public Homepage](./story-2.6-public-homepage.md)
