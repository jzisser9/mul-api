#!/bin/bash
set -e

# Check database environment variables
echo "=== Database Configuration Check ==="
echo "DATABASE_HOST: ${DATABASE_HOST:-'Not set'}"
echo "DATABASE_USER: ${DATABASE_USER:-'Not set'}"
echo "DATABASE_PORT: ${DATABASE_PORT:-'5432 (default)'}"
echo "DATABASE_PASSWORD: ${DATABASE_PASSWORD:+'***SET***'}"
echo "Credentials file removed - no encryption issues"
echo "====================================="

# Wait for database to be ready if host is specified
if [ -n "$DATABASE_HOST" ]; then
  echo "Waiting for database at $DATABASE_HOST:${DATABASE_PORT:-5432}..."
  
  # Try to connect with timeout and better error handling
  if timeout 60 bash -c 'until printf "" 2>>/dev/null >>/dev/tcp/$0/$1; do sleep 1; done' "$DATABASE_HOST" "${DATABASE_PORT:-5432}"; then
    echo "Database is ready!"
  else
    echo "❌ Failed to connect to database at $DATABASE_HOST:${DATABASE_PORT:-5432}"
    echo "Please check:"
    echo "  1. DATABASE_HOST points to correct PostgreSQL server"
    echo "  2. PostgreSQL is running and accepting connections"
    echo "  3. Network connectivity between containers"
    echo "  4. Firewall/security group settings"
    exit 1
  fi
fi

# Run database operations
echo "Creating and migrating database..."
bin/rails db:create db:migrate

echo "Seeding database..."
bin/rails db:seed

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

echo "Starting Rails server..."
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
