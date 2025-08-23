# 📘 Spring PetClinic with Docker

## 🔹 Project Overview

This project demonstrates how to containerize the **Spring PetClinic** application using **Docker Compose**. The project is configured to run in **two environments**:

1. **Development** – Uses **PostgreSQL**.
2. **Production** – Uses **MySQL**.

The application and database services are separated, and the application reads configuration from environment files (`.env.postgres` or `.env.sql`) dynamically.

---

## 🗂️ Project Structure

```
spring-petclinic-compose/
├── docker.compose.yml          # Base Docker Compose
├── docker.compose.dev.yml      # Development overrides (Postgres)
├── docker.compose.prod.yml     # Production overrides (MySQL)
├── .env.postgres               # Dev environment variables
├── .env.sql                    # Prod environment variables
├── Dockerfile                  # Application Dockerfile
└── ...                         # Spring PetClinic source code


                              
                              
                                              ┌─────────────────────────┐
                                              │  docker.compose.yml     │
                                              │   (Base Compose)        │
                                              │  -------------------    │
                                              │  Services: app, db      │
                                              │  env_file: ${ENV_FILE}  │
                                              └─────────▲───────────────┘
                                                        │
                                      ┌─────────────────┴─────────────────┐
                                      │                                   │
                              ┌─────────────────────────┐       ┌─────────────────────────┐
                              │ docker.compose.dev.yml  │       │ docker.compose.prod.yml │
                              │  (Development)          │       │  (Production)           │
                              │  -------------------    │       │  -------------------    │
                              │  db: Postgres           │       │  db: MySQL              │
                              │  env_file: .env.postgres│       │  env_file: .env.sql     │
                              │  volumes: pgdata        │       │  volumes: mysqldata     │
                              │  healthcheck: pg_isready│       │  healthcheck: mysqladmin│
                              └─────────────────────────┘       └─────────────────────────┘
                                      │                                   │
                                      └───────────────┬───────────────────┘
                                                      │
                                                  app service
                                            (reads env from ENV_FILE)

```

---


## ⚙️ Environment Files

### 1️⃣ `.env.postgres` (Development)

<img width="1067" height="279" alt="image" src="https://github.com/user-attachments/assets/4e7fb3ef-db8a-480d-ad19-4e5891d1bd8d" />


### 2️⃣ `.env.sql` (Production)

![Uploading image.png…]()


---

## 🐳 Docker Compose Files

### 1️⃣ `docker.compose.yml` (Base)

* Defines both **app** and **db** services.
* App service reads environment variables dynamically using `ENV_FILE`:

<img width="1166" height="758" alt="image" src="https://github.com/user-attachments/assets/8d2c4867-b88c-4ac9-b30b-8bb9c97ffb41" />



### 2️⃣ `docker.compose.dev.yml` (Development Override)

* Overrides `db` service for PostgreSQL:

<img width="1096" height="451" alt="image" src="https://github.com/user-attachments/assets/a7848e8a-2cb5-4249-b04f-f9d8231ec6c5" />


### 3️⃣ `docker.compose.prod.yml` (Production Override)

* Overrides `db` service for MySQL:

<img width="1626" height="450" alt="image" src="https://github.com/user-attachments/assets/8be86f5d-96d5-4533-a60a-e1e6f1bcfcd9" />


---

## 🚀 How to Run

### 1️⃣ Development (PostgreSQL)

```bash
ENV_FILE=.env.postgres docker compose -f docker.compose.yml -f docker.compose.dev.yml up -d
```

### 2️⃣ Production (MySQL)

```bash
ENV_FILE=.env.sql docker compose -f docker.compose.yml -f docker.compose.prod.yml up -d
```

### 3️⃣ Stop Containers

```bash
docker compose -f docker.compose.yml -f docker.compose.dev.yml down
docker compose -f docker.compose.yml -f docker.compose.prod.yml down
```

---

## ✅ Key Features

* **Dynamic environment switching** using `ENV_FILE`.
* **Healthchecks** for both PostgreSQL and MySQL.
* **Volume persistence** for databases.
* Separate **development** and **production** database configurations.
* **Single app image** for both environments.
