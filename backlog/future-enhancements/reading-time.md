# Enhancement: Reading Time Estimate

**Priority:** P3 (Future)  
**Story Points:** 2

## User Story
**As a** blog reader  
**I want** to see estimated reading time  
**So that** I know how long a post will take

## Acceptance Criteria
- [ ] Calculate based on word count (200 words/min average)
- [ ] Display on post page and in listings
- [ ] Helper method: `reading_time(content)`
- [ ] Format: "5 min read"

## Technical Notes
```ruby
def reading_time(text)
  words = text.split.size
  minutes = (words / 200.0).ceil
  "#{minutes} min read"
end
```
