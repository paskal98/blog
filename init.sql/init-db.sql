create table IF NOT EXISTS peoples
(
    id      bigserial
        primary key,
    code    varchar(255),
    name    varchar(255),
    surname varchar(255)
);

alter table peoples
    owner to postgres;

-- Insert sample data
INSERT INTO Peoples (name, surname, code) VALUES
                                             ('John', 'Doe', '123'),
                                             ('Alice', 'Smith', '456');
