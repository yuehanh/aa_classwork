PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS question_id;
DROP TABLE IF EXISTS question_follows;


CREATE TABLE users(
    id INTEGER PRIMARY KEY, 
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
    );

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    body TEXT NO NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,

    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(parent_id) REFERENCES replies(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER
);

INSERT INTO 
    users(fname, lname)
VALUES
    ('John', 'Dough'),
    ('Khal', 'Drogo'),
    ('Jose', 'Perez');
 
INSERT INTO 
    questions(title, body, user_id)
VALUES  
    ('Life?', 
    'What is the meaning of life?',
    (SELECT id
    FROM users
    WHERE fname = 'John' 
    AND lname = 'Dough')),

    ('Grades?', 
    'What is the average of our grades?',
    (SELECT id
    FROM users
    WHERE fname = 'Khal'
    AND lname = 'Drogo')
    );

INSERT INTO
    question_follows(user_id, question_id)
VALUES 
    (1,1), 
    (1,2),
    (2,1);

INSERT INTO
    replies(question_id, parent_id, user_id, body)
VALUES 
    (1, NULL, 2, 'My moon and Stars'),
    (1, 1, 1, 'You got smothered by a pillow');

INSERT INTO
    question_likes(user_id, question_id)
VALUES  
    (1,1);
