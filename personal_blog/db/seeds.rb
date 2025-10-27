# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create sample user
user = User.find_or_create_by!(provider: 'github', uid: '12345') do |u|
  u.name = 'Sample User'
  u.email = 'sample@example.com'
  u.avatar_url = 'https://avatars.githubusercontent.com/u/12345'
end

puts "Created user: #{user.name}"

# Create sample posts
5.times do |i|
  post = Post.create!(
    title: "Sample Post #{i + 1}",
    content: <<~MARKDOWN
      # Introduction
      
      This is a sample blog post written in **Markdown**. It demonstrates various features:
      
      ## Code Highlighting
      
      ```ruby
      def hello_world
        puts "Hello, World!"
      end
      ```
      
      ```javascript
      function helloWorld() {
        console.log("Hello, World!");
      }
      ```
      
      ## Lists
      
      - Item 1
      - Item 2
      - Item 3
      
      ## Links
      
      Check out [Ruby on Rails](https://rubyonrails.org) for more information.
      
      ## Emphasis
      
      You can use *italic* or **bold** text, and even ~~strikethrough~~.
    MARKDOWN
  )
  
  # Publish the first 3 posts
  if i < 3
    post.publish!
  end
  
  puts "Created post: #{post.title} (#{post.published? ? 'Published' : 'Draft'})"
end

puts "\n✅ Seed data created successfully!"
puts "- 1 user"
puts "- 5 posts (3 published, 2 drafts)"
