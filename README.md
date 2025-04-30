# Local Crates.io Mirror with Panamax

This project provides a Docker setup for running a local mirror of the crates.io registry using the 
[panamax](https://github.com/panamax-rs/panamax) tool. This setup enables faster Rust dependency fetching, supports offline development, and provides consistent dependency sources for development and CI/CD environments.

## Features

*   **Dockerized Setup:** Deploy and manage the `panamax` server and sync process using Docker.
*   **Persistent Data:** Mirror data and configuration are stored persistently using a Docker volume.
*   **Automated Synchronization:** The mirror automatically synchronizes with crates.io daily at 2:00 AM via cron.

## Prerequisites

*   Docker
*   Docker Compose

## Building the Docker Image

You can build the Docker image using either `docker build` or `docker compose build`.

Using `docker build`:

```bash
docker build -t panamax-mirror ./docker
```
