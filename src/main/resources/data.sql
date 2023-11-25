CREATE TABLE if not exists employee (
                          id SERIAL PRIMARY KEY,
                          employee_name VARCHAR(45),
                          salary VARCHAR(45) NOT NULL,
                          created_at TIMESTAMP NOT NULL,
                          updated_at TIMESTAMP DEFAULT NULL
);

INSERT INTO employee (employee_name, salary, created_at, updated_at)
VALUES ('Иван Иванов', '50000', '2023-01-01 09:00:00', NULL),
       ('Елена Петрова', '55000', '2023-01-02 10:00:00', '2023-03-01 12:00:00'),
       ('Алексей Смирнов', '60000', '2023-01-03 11:00:00', NULL);
