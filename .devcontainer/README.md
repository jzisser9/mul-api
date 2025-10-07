# Dev Container Setup for mul-api

This project includes a dev container configuration that provides a complete Ruby on Rails development environment with PostgreSQL database.

## What's Included

- **Ruby 3.1.2** - Matches your project's Ruby version
- **PostgreSQL 15** - Database server with persistent storage
- **Node.js 18** - For any frontend asset compilation needs
- **VS Code Extensions** - Pre-configured Ruby, Rails, and general development extensions
- **Development Tools** - Git, GitHub CLI, PostgreSQL client, and more

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your machine
- [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Opening the Project

1. Clone this repository
2. Open the project folder in VS Code
3. When prompted, click "Reopen in Container" or use the Command Palette (`Ctrl+Shift+P`):
   - Type "Dev Containers: Reopen in Container"
   - Select it and wait for the container to build

### First Time Setup

The dev container will automatically:
- Install all Ruby gems via `bundle install`
- Wait for PostgreSQL to be ready
- Create and migrate the database
- Run database seeds

### Development Workflow

Once the container is running:

```bash
# Start the Rails server
bundle exec rails server -b 0.0.0.0 -p 3001

# Run tests
bundle exec rspec

# Access Rails console
bundle exec rails console

# Run database migrations
bundle exec rails db:migrate

# Access PostgreSQL directly
psql -h db -U postgres -d mul_api_development
```

### Accessing the Application

- **Rails App**: http://localhost:3001
- **PostgreSQL**: localhost:5432 (from host machine)

### Environment Variables

The dev container sets up these environment variables automatically:
- `DATABASE_HOST=db`
- `DATABASE_USER=postgres`
- `DATABASE_PASSWORD=password`
- `DATABASE_PORT=5432`
- `RAILS_ENV=development`

### Troubleshooting

**Container won't start:**
- Ensure Docker is running
- Try rebuilding: Command Palette → "Dev Containers: Rebuild Container"

**Database connection issues:**
- The database takes a few seconds to start
- The post-create script waits for it automatically
- Manual check: `pg_isready -h db -p 5432 -U postgres`

**Port conflicts:**
- If ports 3001 or 5432 are in use, modify them in `.devcontainer/docker-compose.yml`

### Customization

You can customize the dev container by modifying:
- `.devcontainer/devcontainer.json` - VS Code settings and extensions
- `.devcontainer/Dockerfile` - System packages and Ruby setup
- `.devcontainer/docker-compose.yml` - Service configuration
- `.devcontainer/post-create.sh` - Setup scripts

### Benefits

✅ **Consistent Environment** - Everyone gets the same Ruby, PostgreSQL, and tool versions  
✅ **Quick Setup** - New developers can start coding in minutes  
✅ **Isolated** - No need to install Ruby or PostgreSQL on your local machine  
✅ **Persistent Data** - Database data survives container restarts  
✅ **VS Code Integration** - Debugging, extensions, and IntelliSense work seamlessly