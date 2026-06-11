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