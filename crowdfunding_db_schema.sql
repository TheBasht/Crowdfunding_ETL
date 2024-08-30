CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY,
    category VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY,
    subcategory VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name TEXT NOT NULL,
    description TEXT,
    goal DECIMAL(10, 2) NOT NULL,
    pledged DECIMAL(10, 2) DEFAULT 0.00,
    outcome VARCHAR(20),
    backers_count INT DEFAULT 0,
    country CHAR(2),
    currency CHAR(3),
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(10) NOT NULL,
    subcategory_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);