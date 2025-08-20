# 🐾 Spring Petclinic — Dockerized Setup

This project shows how to run the famous **Spring Petclinic** application with **Docker** and **Docker Compose**. It uses **MySQL 8** as the database and a very lightweight **Distroless Java 21** image to run the application.

---

## 🔎 What is Spring Petclinic?

Spring Petclinic is a demo project built by the Spring team. It is used to learn and test how a real-world Spring Boot application works. It manages a simple veterinary clinic:

* **Owners** → personal info of pet owners.
* **Pets** → type and birth date of pets.
* **Vets** → veterinarians and their specialties.
* **Visits** → appointments for pets.

It is a great example for beginners to see how Spring Boot apps are structured and connected to a database.

---

## ⚙️ Technologies Used

* **Java 21** + **Spring Boot**
* **Maven 3.9** for building
* **MySQL 8.0** for data storage
* **Docker & Docker Compose** for containers
* **Distroless Java 21** → secure, lightweight runtime with no shell

---

## 🏗️ How It Works

### Dockerfile (2 stages)

1. **Build Stage**

   * Uses Maven to download the Petclinic source code.
   * Builds the JAR file with `mvn package`.

2. **Runtime Stage**

   * Runs the JAR inside a **distroless image** (no extra tools, only Java runtime).
   * Exposes port **8080** for the app.

### Docker Compose (2 services)

* **db** (MySQL)

  * Creates a database named `petclinic`.
  * Saves data into a Docker volume (`db-data`) so data is not lost when containers stop.

* **app** (Spring Petclinic)

  * Built from the Dockerfile.
  * Connects to the `db` service.
  * Runs on port **8080**.

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/petclinic-docker.git
cd petclinic-docker
```

### 2. Build and Run

```bash
docker compose up --build -d
```

### 3. Check if containers are running

```bash
docker ps
```

### 4. Open the app

👉 Go to: [http://localhost:8080](http://localhost:8080)

---

## 🛠️ Common Commands

* **Stop containers:**

```bash
docker compose down
```

* **Stop + remove data:**

```bash
docker compose down -v
```

* **Rebuild everything from scratch:**

```bash
docker compose build --no-cache
```

---

## 📊 Architecture Diagram

```text
                 +----------------------+
                 |  Spring Petclinic    |
                 |  (App Service)       |
                 |   Port: 8080         |
                 +----------+-----------+
                            |
                            |
                 +----------v-----------+
                 |   MySQL Database     |
                 |   (db Service)       |
                 |   Port: 3306         |
                 +----------------------+

         (Both connected via petclinic-net)

