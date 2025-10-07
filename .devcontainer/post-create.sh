#!/bin/bash

# This script runs after the dev container is created

echo "🚀 Setting up Ruby on Rails development environment..."

# Verify Ruby installation
echo "🔍 Verifying Ruby installation..."
ruby --version
gem --version
bundler --version

# Install Ruby gems
echo "📦 Installing Ruby gems..."
bundle install

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

# Set up SSH permissions if SSH directory exists
if [ -d "/home/vscode/.ssh" ]; then
    echo "🔑 Setting up SSH permissions..."
    sudo chown -R vscode:vscode /home/vscode/.ssh
    chmod 700 /home/vscode/.ssh
    chmod 600 /home/vscode/.ssh/* 2>/dev/null || true
    chmod 644 /home/vscode/.ssh/*.pub 2>/dev/null || true
    
    # Test SSH connection to GitHub
    echo "🔍 Testing GitHub SSH connection..."
    ssh -T git@github.com -o StrictHostKeyChecking=no 2>&1 | head -3 || true
fi

# Make sure the Rails server can bind to all interfaces
echo "✅ Development environment setup complete!"
echo ""
echo "🎉 You can now start developing!"
echo "   • Run 'bundle exec rails server -b 0.0.0.0 -p 3001' to start the Rails server"
echo "   • Run 'bundle exec rspec' to run tests"
echo "   • Run '.devcontainer/check-git-ssh.sh' to verify Git/SSH setup"
echo "   • The app will be available at http://localhost:3001"
echo ""