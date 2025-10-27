# Personal Blog

A secure, performant personal blog for technical articles built with Ruby on Rails, protected by GitHub OAuth SSO, featuring syntax highlighting for 100+ programming languages, self-hosted analytics, and optimized for fast loading.

## Features

✅ **Authentication & Security**
- GitHub OAuth-based Single Sign-On
- Secure session management
- Protected admin interface

✅ **Content Management**
- Full CRUD operations for blog posts
- Markdown rendering with Redcarpet
- Syntax highlighting for 100+ languages using Rouge
- Draft and published post states
- Auto-generated SEO-friendly slugs

✅ **Performance**
- SQLite3 database
- Optimized queries
- Asset pipeline with Propshaft

## Tech Stack

- **Ruby**: 3.4.1
- **Rails**: 8.1.0
- **Database**: SQLite3
- **Authentication**: OmniAuth GitHub
- **Markdown**: Redcarpet
- **Syntax Highlighting**: Rouge
- **Pagination**: Kaminari
- **Performance Tools**: Bullet, Rack Mini Profiler

## Prerequisites

- Ruby 3.0+ (recommended: 3.4.1)
- Rails 8.1+
- Git
- GitHub account for OAuth

## Installation

### 1. Clone the repository

```bash
git clone <repository-url>
cd personal_blog
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Configure GitHub OAuth

1. Go to [GitHub Developer Settings](https://github.com/settings/developers)
2. Create a new OAuth application
3. Set the callback URL to: `http://localhost:3000/auth/github/callback`
4. Copy your Client ID and Client Secret

### 4. Set environment variables

Create a `.env` file or set environment variables:

```bash
export GITHUB_CLIENT_ID=your_client_id_here
export GITHUB_CLIENT_SECRET=your_client_secret_here
```

Or use Rails credentials:

```bash
rails credentials:edit
```

Add:

```yaml
github:
  client_id: your_client_id_here
  client_secret: your_client_secret_here
```

### 5. Setup database

```bash
rails db:create
rails db:migrate
rails db:seed
```

This will create:
- 1 sample user
- 5 sample posts (3 published, 2 drafts)

### 6. Start the server

```bash
rails server
```

Visit `http://localhost:3000`

## Usage

### Authentication

1. Navigate to `http://localhost:3000`
2. You'll be redirected to GitHub OAuth
3. Authorize the application
4. You'll be redirected back to the blog

### Managing Posts

- **View all posts**: `/posts`
- **Create new post**: `/posts/new`
- **Edit post**: `/posts/:slug/edit`
- **Delete post**: Click "Delete" button on post list

### Markdown Examples

```markdown
# Heading 1
## Heading 2

**Bold text** and *italic text*

- List item 1
- List item 2

```ruby
def hello_world
  puts "Hello, World!"
end
```
```

## Development

### Running Tests

```bash
rails test
```

### Database Commands

```bash
# Reset database
rails db:reset

# Run migrations
rails db:migrate

# Rollback migration
rails db:rollback
```

### Rails Console

```bash
rails console
```

## Project Structure

```
personal_blog/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   ├── posts_controller.rb
│   │   └── sessions_controller.rb
│   ├── models/
│   │   ├── user.rb
│   │   └── post.rb
│   ├── views/
│   │   ├── posts/
│   │   └── layouts/
│   └── helpers/
│       └── application_helper.rb (Markdown & syntax highlighting)
├── config/
│   ├── routes.rb
│   ├── database.yml
│   └── initializers/
│       └── omniauth.rb
├── db/
│   ├── migrate/
│   ├── schema.rb
│   └── seeds.rb
└── README.md
```

## Configuration

### Session Timeout

Sessions expire after 2 weeks of inactivity. Modify in `config/initializers/session_store.rb` if needed.

### Syntax Highlighting Theme

To change the syntax highlighting theme:

```bash
rougify style monokai > app/assets/stylesheets/rouge.css
```

Available themes: `base16`, `colorful`, `github`, `monokai`, `monokai.sublime`, `thankful_eyes`, etc.

## Deployment

### Production Setup

1. Set environment variables on your hosting platform
2. Run migrations: `rails db:migrate RAILS_ENV=production`
3. Precompile assets: `rails assets:precompile`
4. Update GitHub OAuth callback URL to production domain

### Backup Database

```bash
# Backup
cp storage/production.sqlite3 backups/production_$(date +%Y%m%d).sqlite3

# Restore
cp backups/production_20231026.sqlite3 storage/production.sqlite3
```

## Troubleshooting

### OAuth Error

- Verify GitHub OAuth credentials
- Check callback URL matches exactly
- Ensure environment variables are set

### Database Issues

```bash
rails db:reset  # Warning: destroys all data
```

### Asset Loading Issues

```bash
rails assets:precompile
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

For issues and questions, please open an issue on GitHub.
