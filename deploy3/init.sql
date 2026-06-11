CREATE TABLE students ( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100), 
    age INTEGER 
); 


INSERT INTO students(name, age) VALUES ('John', 20), ('Mary', 22), ('David', 19);
INSERT INTO students(name, age) VALUES ('Alice', 21), ('Bob', 23);
INSERT INTO students(name, age) VALUES ('Charlie', 24), ('Diana', 20);
INSERT INTO students(name, age) VALUES ('Eve', 22), ('Frank', 24);
INSERT INTO students(name, age) VALUES ('Grace', 21), ('Henry', 23);
INSERT INTO students(name, age) VALUES ('Ivy', 22), ('Jack', 24);
INSERT INTO students(name, age) VALUES ('Kate', 21), ('Liam', 23);
INSERT INTO students(name, age) VALUES ('Mia', 22), ('Noah', 24);
INSERT INTO students(name, age) VALUES ('Olivia', 21), ('Peter', 23);
INSERT INTO students(name, age) VALUES ('Quinn', 22), ('Ryan', 24);
INSERT INTO students(name, age) VALUES ('Sophia', 21), ('Thomas', 23);


CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100)
);

INSERT INTO teachers(name, subject) VALUES ('Mr. Smith', 'Math'), ('Ms. Johnson', 'Science'), ('Dr. Brown', 'History');
INSERT INTO teachers(name, subject) VALUES ('Prof. Davis', 'English'), ('Dr. Wilson', 'Physics'), ('Ms. Taylor', 'Chemistry');
INSERT INTO teachers(name, subject) VALUES ('Mr. Anderson', 'Biology'), ('Ms. Garcia', 'Geography'), ('Dr. Martinez', 'Art');
INSERT INTO teachers(name, subject) VALUES ('Prof. White', 'Music'), ('Dr. Green', 'PE'), ('Ms. Blue', 'Computer Science');
INSERT INTO teachers(name, subject) VALUES ('Mr. Black', 'Physical Education'), ('Ms. White', 'Art'), ('Dr. Blue', 'Computer Science');