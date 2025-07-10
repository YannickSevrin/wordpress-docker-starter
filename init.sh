#!/bin/bash
set -e

# Check if WordPress is already installed
if wp core is-installed --allow-root; then
  echo "✅ WordPress already installed. Skipping init."
  exit 0
fi

echo "🚀 Installing WordPress..."

wp core download --allow-root

wp config create \
  --dbname=$WORDPRESS_DB_NAME \
  --dbuser=$WORDPRESS_DB_USER \
  --dbpass=$WORDPRESS_DB_PASSWORD \
  --dbhost=$WORDPRESS_DB_HOST \
  --skip-check \
  --allow-root

wp core install \
  --url="http://localhost:8000" \
  --title="Docker WP" \
  --admin_user=admin \
  --admin_password=admin \
  --admin_email=admin@example.com \
  --skip-email \
  --allow-root

echo "✅ WordPress installed!"