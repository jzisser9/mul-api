#!/bin/bash
set -e

# Check database environment variables
echo "=== Database Configuration Check ==="
echo "DATABASE_HOST: ${DATABASE_HOST:-'Not set'}"
echo "DATABASE_USER: ${DATABASE_USER:-'Not set'}"
echo "DATABASE_PORT: ${DATABASE_PORT:-'5432 (default)'}"
echo "DATABASE_PASSWORD: ${DATABASE_PASSWORD:+'***SET***'}"
echo "====================================="

# Wait for database to be ready if host is specified
if [ -n "$DATABASE_HOST" ]; then
  echo "Waiting for database at $DATABASE_HOST:${DATABASE_PORT:-5432}..."
  timeout 60 bash -c 'until printf "" 2>>/dev/null >>/dev/tcp/$0/$1; do sleep 1; done' "$DATABASE_HOST" "${DATABASE_PORT:-5432}"
  echo "Database is ready!"
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
