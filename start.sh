#!/bin/bash

echo "🚀 Starting MUL API with Docker Compose..."
echo "   Database: PostgreSQL with simple credentials"
echo "   API: http://localhost:3001"
echo ""

# Build and start services
docker-compose up --build

echo ""
echo "✅ Services stopped. Database data is persisted in Docker volume 'postgres_data'"