# EPIC-5: Infrastructure & Deployment

## Overview
Project setup, database configuration, hosting, and CI/CD for reliable development and production environments.

## Goals
- Rails project properly configured
- SQLite database setup for simplicity
- Smooth development experience
- Production deployment to Heroku or VPS
- Automated CI/CD pipeline

## Stories
1. [Story 5.1: Project Setup](./story-5.1-project-setup.md) - 3 points
2. [Story 5.2: Database Configuration](./story-5.2-database-config.md) - 2 points
3. [Story 5.3: Development Environment](./story-5.3-dev-environment.md) - 3 points
4. [Story 5.4: Production Deployment](./story-5.4-deployment.md) - 8 points
5. [Story 5.5: CI/CD Pipeline](./story-5.5-cicd.md) - 5 points

## Total Story Points: 21

## Tech Stack
- Ruby 3.0+
- Rails 7.0+
- SQLite3 for database
- Puma web server
- GitHub Actions for CI/CD
- Heroku or VPS for hosting

## Technical Notes
- Use Rails credentials for secrets
- SQLite for simplicity (easy backup)
- No Docker unless it simplifies deployment
