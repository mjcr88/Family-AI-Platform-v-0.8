# Family AI Workspace

cd /Users/mj/Developer/Family\ AI\ v\ 1.2

./start-all.sh

## Overview
This workspace is designed to host and manage multiple services and applications, including Outline, n8n, and WebUI. It is structured to ensure clarity, modularity, and ease of maintenance.

## Directory Structure

### Root Directory
- **`instructions outline.txt`**: A text file containing instructions or notes related to the workspace.
- **`config/`**: Contains environment configuration files for the various services.
- **`data/`**: Stores persistent data for services like ArangoDB, n8n, Qdrant, and WebUI.
- **`dev-tools/`**: Contains the `docker-compose.yml` file and configurations for development tools like n8n and WebUI.
- **`outline/`**: Contains the Outline application and its associated configurations, scripts, and data.
- **`platform/`**: Contains core services and configurations shared across the platform.

### `config/`
- **`env/`**: Centralized location for environment files:
  - `env.oidc`: Configuration for OpenID Connect (OIDC) authentication.
  - `env.oidc-server`: Configuration for the OIDC server.
  - `env.outline`: Configuration for the Outline application.

### `data/`
- **`arango/`**: Persistent data for ArangoDB.
- **`n8n/`**: Persistent data for the n8n service.
- **`qdrant/`**: Persistent data for the Qdrant vector database.
- **`webui/`**: Persistent data for the WebUI service.

### `dev-tools/`
- **`docker-compose.yml`**: Docker Compose configuration for development tools like n8n and WebUI.

### `outline/`
- **`docker-compose.yml`**: Docker Compose configuration for the Outline application.
- **`LICENSE`**: License information for the Outline application.
- **`Makefile`**: Makefile for automating tasks related to Outline.
- **`README.md`**: Documentation for the Outline application.
- **`config/`**: Contains additional configurations for Outline:
  - `nginx/`: Nginx configuration files.
  - `sample/`: Sample configuration files.
  - `uc/`: Configuration for the OIDC server.
- **`data/`**: Persistent data for Outline:
  - `minio/`: Data for MinIO storage.
  - `outline/`: Data for the Outline application.
  - `pgdata/`: PostgreSQL data for Outline.
  - `postgres/`: Additional PostgreSQL data.
  - `uc/`: Data for the OIDC server.
- **`scripts/`**: Scripts for managing and configuring Outline:
  - `config.sh`: Configuration script.
  - `main.sh`: Main script for setup and management.
  - `utils.sh`: Utility functions.
  - `templates/`: Template files for environment and configuration.

### `platform/`
- **`docker-compose.core.yml`**: Docker Compose configuration for core services like NATS, ArangoDB, and Qdrant.

## Services

### Outline
- A knowledge base and documentation platform.
- Accessible at `http://localhost:3000`.
- Configured using `config/env/env.outline`.

### n8n
- A workflow automation tool.
- Accessible at `http://localhost:5678`.
- Configured using `config/env/.env.dev-tools`.

### WebUI
- A user interface for managing certain platform features.
- Accessible at `http://localhost:8080`.
- Configured using `config/env/.env.dev-tools`.

### Core Services
- **NATS**: Service bus for inter-component communication.
- **ArangoDB**: Graph database for structured knowledge.
- **Qdrant**: Vector database for embeddings and semantic search.

## How to Use

1. **Start Services**:
   - Use `docker-compose` to start the services in their respective directories.
   - Example: `docker-compose -f outline/docker-compose.yml up -d`.

2. **Environment Configuration**:
   - Update the `.env` files in `config/env/` as needed.

3. **Persistent Data**:
   - Ensure the `data/` directory is backed up regularly to prevent data loss.

4. **Development Tools**:
   - Use the `dev-tools/` directory for managing n8n and WebUI.

## Outline Wiki Setup

### Features
- A simple make and bash script to generate all required configurations.
- A `docker-compose` setup to run the service.
- An OIDC server to manage users without requiring Slack or Google login.

### How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/vicalloy/outline-docker-compose.git
   cd outline-docker-compose
   ```

2. **Initialize the Configuration:**
   ```bash
   cp scripts/config.sh.sample scripts/config.sh
   # Update the configuration file as needed:
   vim scripts/config.sh
   ```

3. **Install and Start the Service:**
   ```bash
   make install
   ```
   This will:
   - Create a `docker-compose` configuration file.
   - Start the service.
   - Initialize the OIDC server (add an OIDC client for Outline and create a superuser).

4. **Access the Service:**
   - Open [http://127.0.0.1:8888](http://127.0.0.1:8888) to log in to Outline.
   - To add new users, visit [http://127.0.0.1:8888/uc/admin/auth/user/](http://127.0.0.1:8888/uc/admin/auth/user/).

### Notes
- Outline Wiki 0.72.0-1 supports local file storage. Set `FILE_STORAGE=local` in `scripts/config.sh` to use local file storage (MinIO is not required).
- Ensure that the required ports are available before starting the service.

## Notes
- Ensure all required environment variables are set before starting the services.
- Refer to the individual `README.md` files in each service directory for more details.

## Future Improvements
- Consolidate redundant configurations where possible.
- Automate backups for the `data/` directory.
- Add monitoring and logging for all services.
