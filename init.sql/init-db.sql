CREATE TABLE IF NOT EXISTS posts (
                                     id SERIAL PRIMARY KEY,
                                     description TEXT,
                                     content TEXT,
                                     title VARCHAR(255)
    );

INSERT INTO posts (description, content, title)
VALUES ('Example Description', 'Example Content', 'Example Title');