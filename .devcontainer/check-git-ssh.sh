#!/bin/bash

# Git & SSH Configuration Helper for Dev Container
# This script helps configure Git and test SSH connectivity

echo "🔧 Git & SSH Configuration Helper"
echo "================================="

# Check if SSH agent is working
echo ""
echo "🔍 Checking SSH Agent..."
if [ -n "$SSH_AUTH_SOCK" ] && [ -S "$SSH_AUTH_SOCK" ]; then
    echo "✅ SSH Agent is available at: $SSH_AUTH_SOCK"
    
    # List available keys
    echo ""
    echo "🔑 Available SSH keys:"
    ssh-add -l 2>/dev/null || echo "No keys found in SSH agent"
else
    echo "❌ SSH Agent not available"
    echo "💡 Make sure you have started ssh-agent on your host machine:"
    echo "   eval \$(ssh-agent -s)"
    echo "   ssh-add ~/.ssh/id_rsa  # or your key file"
fi

# Check SSH directory
echo ""
echo "📁 SSH Directory Status:"
if [ -d "/home/vscode/.ssh" ]; then
    echo "✅ SSH directory exists"
    ls -la /home/vscode/.ssh/ | grep -E '\.(pub|key|pem)$' || echo "No key files found"
else
    echo "❌ SSH directory not found"
fi

# Test GitHub connection
echo ""
echo "🐙 Testing GitHub SSH connection..."
ssh -T git@github.com -o ConnectTimeout=10 -o StrictHostKeyChecking=no 2>&1 | head -5

# Check Git configuration
echo ""
echo "📝 Git Configuration:"
echo "User Name: $(git config --global user.name || echo 'Not configured')"
echo "User Email: $(git config --global user.email || echo 'Not configured')"

# Offer to configure Git if needed
if [ -z "$(git config --global user.name)" ] || [ -z "$(git config --global user.email)" ]; then
    echo ""
    echo "⚠️  Git user configuration is incomplete"
    echo "💡 To configure Git, run:"
    echo "   git config --global user.name 'Your Name'"
    echo "   git config --global user.email 'your.email@example.com'"
fi

echo ""
echo "🎉 Configuration check complete!"