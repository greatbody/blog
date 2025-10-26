# Story 5.1: Project Setup

**Epic:** EPIC-5: Infrastructure & Deployment  
**Priority:** P0 (Must Have)  
**Story Points:** 3

## User Story
**As a** developer  
**I want** a properly configured Rails project  
**So that** development can begin efficiently

## Acceptance Criteria
- [ ] Rails app created: `rails new personal_blog --database=sqlite3`
- [ ] Ruby 3.0+ specified in Gemfile and .ruby-version
- [ ] Rails 7.0+ specified in Gemfile
- [ ] Required gems added: omniauth-github, rouge, redcarpet, browser, kaminari
- [ ] Development gems: bullet, rack-mini-profiler
- [ ] Test gems: minitest, capybara
- [ ] Git repository initialized with proper .gitignore
- [ ] Rails credentials configured for secrets
- [ ] README documented with setup instructions

## Definition of Done
- [ ] All acceptance criteria met
- [ ] `rails server` runs successfully
- [ ] `bundle install` completes without errors
- [ ] Git repo initialized
- [ ] README complete with tech stack and setup steps
