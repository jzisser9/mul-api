# MUL API

This API serves as a database for IDs from masterunitlist.info. There is currently no publicly-available API to access 
unit information. However, the MegaMek project has a database of units and their IDs on the MUL. This API serves those 
IDs to be used for client applications. 

## Setup

1. Download MegaMek from https://megamek.org/downloads
2. Extract MegaMek, then go into the `data/mechfiles` directory
3. Extract all `.zip` files in that directory into their own folders. On MacOS, doing this with Archive Utility 
   automates the process.
4. Move these folders into MUL API's `/data` directory.
5. Do the usual Rails stuff (`bundle install`, `rails db:setup`, etc)
6. Seed your database from the MM data files with `rails db:seed`.

## Development Container Setup

This project includes a VS Code dev container configuration for consistent development environments.

### Prerequisites for SSH/Git Access

To push to GitHub from within the dev container, you need SSH agent forwarding configured:

**On macOS/Linux:**
```bash
# Start SSH agent (if not already running)
eval $(ssh-agent -s)

# Add your SSH key
ssh-add ~/.ssh/id_rsa  # or your specific key file

# Verify your key is added
ssh-add -l
```

**On Windows:**
```powershell
# Start SSH agent service
Set-Service -Name ssh-agent -StartupType Automatic
Start-Service ssh-agent

# Add your SSH key
ssh-add ~\.ssh\id_rsa  # or your specific key file
```

### Using the Dev Container

1. **Open in VS Code**: Open this repository in VS Code
2. **Reopen in Container**: Use the "Reopen in Container" prompt or Command Palette
3. **Test SSH**: Run `.devcontainer/check-git-ssh.sh` to verify SSH connectivity
4. **Configure Git** (if needed):
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

The dev container automatically:
- Sets up Ruby 3.1.2, Rails, and PostgreSQL using dev container features
- Installs Ruby LSP for enhanced IDE experience with modern tooling
- Installs all dependencies and sets up the database
- Forwards your SSH credentials for Git operations
- Configures RuboCop for code formatting and linting

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment with the following features:

### Semantic Versioning
The project uses [Semantic Release](https://semantic-release.gitbook.io/) for automated versioning based on commit messages. Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

- `fix:` - patch version (e.g., 1.0.1)
- `feat:` - minor version (e.g., 1.1.0) 
- `feat!:` or `fix!:` or any commit with `BREAKING CHANGE:` - major version (e.g., 2.0.0)

Examples:
```
feat: add new unit search endpoint
fix: resolve database connection issue
feat!: change API response format (breaking change)
```

### Docker Images
Production-ready Docker images are automatically built and pushed to GitHub Container Registry (ghcr.io) for:
- Every commit to the `main` branch
- Every pull request (for testing)

The images are tagged with:
- Version numbers (e.g., `v1.2.3`)
- Branch names (e.g., `main`)
- `latest` tag for the main branch

### Running with Docker

#### Quick Start (Recommended)
```bash
# Start everything with Docker Compose
./start.sh

# Or manually:
docker-compose up --build
```

This starts both PostgreSQL and the Rails API with simple, pre-configured credentials.

#### Production Deployment
**Simple setup (matches docker-compose.yml):**
```bash
docker pull ghcr.io/jzisser9/mul-api:latest
docker run -p 3001:3001 \
  -e DATABASE_HOST=your-postgres-host \
  -e DATABASE_USER=postgres \
  -e DATABASE_PASSWORD=password \
  -e DATABASE_PORT=5432 \
  -e RAILS_ENV=production \
  -e RAILS_LOG_TO_STDOUT=true \
  -e RAILS_SERVE_STATIC_FILES=true \
  ghcr.io/jzisser9/mul-api:latest
```

**Or using DATABASE_URL:**
```bash
docker pull ghcr.io/jzisser9/mul-api:latest
docker run -p 3001:3001 \
  -e DATABASE_URL=postgres://postgres:password@your-host:5432/mul_api_production \
  -e RAILS_ENV=production \
  ghcr.io/jzisser9/mul-api:latest
```

### Container Environment Configuration

#### Simple Database Setup (Public API)
For the easiest deployment, use these exact values (matches docker-compose.yml):
- `DATABASE_HOST=your-postgres-host` (or `db` for Docker Compose)
- `DATABASE_USER=postgres`
- `DATABASE_PASSWORD=password`
- `DATABASE_PORT=5432`

Or as a single URL:
- `DATABASE_URL=postgres://postgres:password@your-host:5432/mul_api_production`

#### Rails Configuration
- `RAILS_ENV=production` - Run in production mode
- `RAILS_LOG_TO_STDOUT=true` - Log to container stdout for monitoring
- `RAILS_SERVE_STATIC_FILES=true` - Serve static assets without nginx

**Note**: These are simple credentials suitable for public data only. See `.env.example` for the complete template.

### Workflow Details

The `.github/workflows/release-and-deploy.yml` workflow:
1. **Test** - Runs RSpec tests against a PostgreSQL database
2. **Semantic Release** - Analyzes commit messages and creates releases
3. **Build & Push** - Builds multi-architecture Docker images (amd64/arm64)

All steps run automatically on push to `main` or when creating pull requests.