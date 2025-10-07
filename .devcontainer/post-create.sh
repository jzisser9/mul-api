#!/bin/bash

# This script runs after the dev container is created

echo "🚀 Setting up Ruby on Rails development environment..."

# Install Ruby gems
echo "📦 Installing Ruby gems..."
bundle install

# Recompile native extensions for current architecture
echo "🔧 Recompiling native gems for container architecture..."
bundle pristine bootsnap || true
bundle pristine nokogiri || true

# Wait for database to be ready
echo "⏳ Waiting for database to be ready..."
until pg_isready -h db -p 5432 -U postgres; do
  echo "Waiting for database..."
  sleep 2
done

# Set up database
echo "🗄️ Setting up database..."
bundle exec rails db:create db:migrate db:seed || true

# Install any additional tools
echo "🔧 Installing additional development tools..."

# Make sure the Rails server can bind to all interfaces
echo "✅ Development environment setup complete!"
echo ""
echo "🎉 You can now start developing!"
echo "   • Run 'bundle exec rails server -b 0.0.0.0 -p 3001' to start the Rails server"
echo "   • Run 'bundle exec rspec' to run tests"
echo "   • The app will be available at http://localhost:3001"
echo ""