-- Создание таблиц

CREATE TABLE 'group' (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE student (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    group_id INTEGER REFERENCES 'group'(id) NOT NULL
);

CREATE TABLE student_marks (
    student_id INTEGER REFERENCES student(id) PRIMARY KEY,
    math_mark_average FLOAT,
    physics_mark_average FLOAT,
    python_mark_average FLOAT
);

-- Заполняем данные

INSERT INTO 'group' VALUES (1, 'Группа A', 'Некое описание');
INSERT INTO 'group' VALUES (2, 'Группа B', 'Некое описание');

INSERT INTO student VALUES (1, 'Вася', 1);
INSERT INTO student VALUES (2, 'Петя', 1);
INSERT INTO student VALUES (3, 'Маша', 2);
INSERT INTO student VALUES (4, 'Степа', 2);

INSERT INTO student_marks VALUES (1, 4.4, 4.9, 4.1);
INSERT INTO student_marks VALUES (2, 3.3, 4.4, 3.8);
INSERT INTO student_marks VALUES (3, 5, 5, 4.5);
INSERT INTO student_marks VALUES (4, 4.6, 4.3, 4.9);

-- Запросы

SELECT
    s.name, g.name, (math_mark_average + physics_mark_average + python_mark_average)/3 AS avgMark
FROM student_marks
         JOIN student
    AS s ON s.id = student_id
         JOIN 'group'
    AS g ON g.id = s.group_id
ORDER BY avgMark DESC;

SELECT name FROM 'group' WHERE id = 1;
SELECT name FROM student WHERE group_id = 2;
SELECT math_mark_average FROM student_marks WHERE student_id = 3;