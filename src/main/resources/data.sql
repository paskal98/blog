CREATE TABLE IF NOT EXISTS category (
                                        id BIGSERIAL PRIMARY KEY,
                                        name VARCHAR(255) NOT NULL,
    description TEXT
    );

INSERT INTO category (name, description) VALUES ('Technology', 'Posts related to technology') ON CONFLICT (name) DO NOTHING;
INSERT INTO category (name, description) VALUES ('Lifestyle', 'Posts related to lifestyle') ON CONFLICT (name) DO NOTHING;
-- Add more INSERT statements as needed for other categories.
