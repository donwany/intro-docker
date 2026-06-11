# PostgreSQL with Docker Compose

## Project Structure

```text
postgres-demo/
├── compose.yaml
└── init.sql
```
---

## Step 1: Create compose.yaml

```yaml
services:
  postgres:
    image: postgres:17
    container_name: postgres-db
    restart: unless-stopped
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: password
      POSTGRES_DB: school
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql

volumes:
  postgres_data:
```

---

## Step 2: Create init.sql

```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER
);

INSERT INTO students(name, age)
VALUES
('John', 20),
('Mary', 22),
('David', 19);
```

The SQL file runs automatically the first time PostgreSQL starts.

---

## Step 3: Start PostgreSQL

```bash
docker compose up -d
```

Verify:

```bash
docker ps
```

Expected:

```text
CONTAINER ID   IMAGE         NAME
xxxxxxx        postgres:17   postgres-db
```

---

## Step 4: View Logs

```bash
docker compose logs -f
```

---

## Step 5: Connect to PostgreSQL

Enter the container:

```bash
docker exec -it postgres-db bash
```

Connect to PostgreSQL:

```bash
psql -U root -d school
```

---

## Step 6: Verify Data

List tables:

```sql
\dt
```

Query data:

```sql
SELECT * FROM students;
```

Expected:

```text
 id | name  | age
----+-------+-----
 1  | John  | 20
 2  | Mary  | 22
 3  | David | 19
```

---

## Step 7: Connect from Host Machine

```bash
psql -h localhost -p 5432 -U root -d school
```

Password:

```text
password
```

---

## Step 8: Connect from Python

Install:

```bash
uv init 
uv venv 
uv add psycopg[binary]
```

Example:

```python

import psycopg

conn = psycopg.connect(
    host="localhost",
    port=5432,
    dbname="school",
    user="root",
    password="password"
)

cur = conn.cursor()

cur.execute("SELECT * FROM students")

for row in cur.fetchall():
    print(row)

conn.close()
```

---

## Volume Persistence

The database files are stored in:

```text
/var/lib/postgresql/data
```

through the named volume:

```yaml
volumes:
  - postgres_data:/var/lib/postgresql/data
```

Delete the container:

```bash
docker compose down
```

Start again:

```bash
docker compose up -d
```

The data remains because it is stored in the Docker volume.

---

## Common Commands

### Start

```bash
docker compose up -d
```

### Stop

```bash
docker compose down
```

### Restart

```bash
docker compose restart
```

### View Logs

```bash
docker compose logs -f
```

### Enter Container

```bash
docker exec -it postgres-db bash
```

### Open PostgreSQL Shell

```bash
docker exec -it postgres-db psql -U root -d school
```

### Remove Everything Including Volume

```bash
docker compose down -v
```

Warning: This deletes all database data.

---

## Production Connection String

```text
postgresql://root:password@localhost:5432/school
```
