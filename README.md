# 🐳 WordPress Docker Starter

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![WordPress](https://img.shields.io/badge/WordPress-21759B?style=for-the-badge&logo=wordpress&logoColor=white)](https://wordpress.org/)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> A clean, minimal boilerplate for running WordPress locally using Docker.

This project is intended as a base template — no themes, no plugins, no uploads. Just a reproducible environment to spin up a fresh WordPress install quickly and cleanly.

---

## 📋 Table of Contents

- [✨ Features](#-features)
- [🏗️ Project Structure](#️-project-structure)
- [📋 Prerequisites](#-prerequisites)
- [🚀 Quick Start](#-quick-start)
- [🔧 Configuration](#-configuration)
- [🌐 Access Points](#-access-points)
- [📝 Common Commands](#-common-commands)
- [🛠️ Troubleshooting](#️-troubleshooting)
- [📚 Additional Resources](#-additional-resources)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## ✨ Features

- 🐳 **Docker-based** - Containerized development environment
- 🔄 **Auto-install** - WordPress automatically installed via WP-CLI
- 🗄️ **MySQL 8.0** - Reliable database with persistent storage
- 🔍 **phpMyAdmin** - Web-based database management
- ⚙️ **Custom PHP config** - Optimized upload limits and memory settings
- 🔐 **Environment variables** - Secure configuration management
- 🎯 **Clean slate** - No pre-installed themes or plugins
- 📦 **Ready to use** - Clone and start developing immediately

---

## 🏗️ Project Structure

```
wordpress-docker-starter/
├── 📄 .env.example           # Sample environment variables
├── 🐳 docker-compose.yml     # Docker services configuration
├── ⚙️ custom-php.ini         # PHP configuration (memory, upload limits)
├── 🚀 init.sh                # WordPress auto-install script
├── 📝 wp-cli.yml             # WP-CLI configuration
├── 📂 wp-content/            # WordPress content directory
│   ├── 🔌 plugins/           # Plugins directory (empty)
│   └── 🎨 themes/            # Themes directory (empty)
├── 🚫 .gitignore             # Git ignore rules
└── 📖 README.md              # This file
```

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Docker](https://www.docker.com/get-started) (version 20.10 or higher)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 1.29 or higher)
- [Git](https://git-scm.com/downloads) (for cloning the repository)

### System Requirements

- **RAM:** 2GB minimum, 4GB recommended
- **Storage:** 1GB free space minimum
- **OS:** Windows 10/11, macOS 10.15+, or Linux

---

## 🚀 Quick Start

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/YannickSevrin/wordpress-docker-starter.git
cd wordpress-docker-starter
```

### 2️⃣ Configure Environment

```bash
# Copy the example environment file
cp .env.example .env

# Edit the .env file with your preferred settings
nano .env  # or use your preferred editor
```

### 3️⃣ Start the Environment

```bash
# Start all services
docker-compose up --build

# Or run in detached mode (background)
docker-compose up -d --build
```

### 4️⃣ Access Your Site

Your WordPress site will be automatically installed and ready to use!

---

## 🔧 Configuration

### Environment Variables

The `.env` file contains all the configuration options:

```env
# Database Configuration
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress
MYSQL_PASSWORD=your_secure_password
MYSQL_ROOT_PASSWORD=your_root_password
```

### PHP Configuration

The `custom-php.ini` file allows you to customize PHP settings:

```ini
upload_max_filesize = 512M
post_max_size = 512M
memory_limit = 512M
max_execution_time = 300
max_input_time = 300
```

---

## 🌐 Access Points

| Service | URL | Credentials |
|---------|-----|-------------|
| **WordPress Frontend** | [http://localhost:8000](http://localhost:8000) | `admin` / `admin` |
| **WordPress Admin** | [http://localhost:8000/wp-admin](http://localhost:8000/wp-admin) | `admin` / `admin` |
| **phpMyAdmin** | [http://localhost:8080](http://localhost:8080) | `root` / *as defined in .env* |

> ⚠️ **Security Notice:** Change the default admin credentials after first login!

---

## 📝 Common Commands

### Docker Operations

```bash
# Start services
docker-compose up

# Start in background
docker-compose up -d

# Stop services
docker-compose down

# Rebuild containers
docker-compose up --build

# View logs
docker-compose logs -f

# Remove everything (including volumes)
docker-compose down -v
```

### WordPress CLI Commands

```bash
# Access WordPress CLI
docker-compose exec wordpress wp --info

# Install a plugin
docker-compose exec wordpress wp plugin install plugin-name --activate

# Update WordPress
docker-compose exec wordpress wp core update

# Create a new user
docker-compose exec wordpress wp user create username email@example.com --role=administrator
```

### Database Operations

```bash
# Access MySQL directly
docker-compose exec db mysql -u root -p

# Create database backup
docker-compose exec db mysqldump -u root -p wordpress > backup.sql

# Import database
docker-compose exec -i db mysql -u root -p wordpress < backup.sql
```

---

## 🛠️ Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Check what's using port 8000
lsof -i :8000
# Kill the process or change the port in docker-compose.yml
```

#### Database Connection Issues
```bash
# Check container status
docker-compose ps

# View database logs
docker-compose logs db

# Restart database service
docker-compose restart db
```

#### WordPress Installation Fails
```bash
# Check WordPress container logs
docker-compose logs wordpress

# Manually trigger installation
docker-compose exec wordpress bash /docker-entrypoint-initwp.d/init.sh
```

### Reset Everything

```bash
# Complete reset (WARNING: This will delete all data!)
docker-compose down -v
docker-compose up --build
```

---

## 📚 Additional Resources

- [WordPress Developer Documentation](https://developer.wordpress.org/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [WP-CLI Documentation](https://wp-cli.org/)
- [MySQL Documentation](https://dev.mysql.com/doc/)

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Development Guidelines

- Follow existing code style and conventions
- Test your changes thoroughly
- Update documentation as needed
- Add comments for complex logic

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 YannickSevrin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

<div align="center">

**⭐ Star this repository if it helped you!**

Made with ❤️ by [YannickSevrin](https://github.com/YannickSevrin)

[⬆ Back to top](#-wordpress-docker-starter)

</div>