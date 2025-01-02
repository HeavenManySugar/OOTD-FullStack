# OOTD-FullStack

Run OOTD frontend and backend using Docker Compose.

**Note:** The first launch requires at least 30 seconds to restore the database.

## Getting Started

This branch is designed for Docker Compose.

First, clone this repository:

```bash
git clone --recursive https://github.com/HeavenManySugar/OOTD-FullStack.git
```

Navigate to the OOTD-FullStack directory and start the system with:

```bash
docker compose up
```

This will run the database, backend, and frontend systems.

**Note:** The first startup requires at least 30 seconds.

## Rebuilding Containers
If you make changes to the frontend or backend, you need to rebuild the containers:

```bash
docker compose up --build --force-recreate --no-deps
```

**Note:** The database files are stored in the db-data directory in the same folder. Updating should not destroy the data in the database.
