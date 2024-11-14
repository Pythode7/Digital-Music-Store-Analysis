-- Create database music_store
CREATE DATABASE music_store;


-- Create the genre table
CREATE TABLE genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create the artist table
CREATE TABLE artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(200)
);

-- Create the album table
CREATE TABLE album (
    album_id INT PRIMARY KEY,
    title VARCHAR(200),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

-- Create the media_type table
CREATE TABLE media_type (
    media_type_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create the playlist table
CREATE TABLE playlist (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(200)
);

-- Create the employee table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(100),
    first_name VARCHAR(100),
    title VARCHAR(100),
    reports_to INT,
    levels VARCHAR(5),
    birth_date DATE,
    hire_date DATE,
    address VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(100)    
);

-- Create the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    company VARCHAR(200),
    address VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(100),
    support_rep_id INT,
    FOREIGN KEY (support_rep_id) REFERENCES employee (employee_id)    
);

-- Create the invoice table
CREATE TABLE invoice (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    billing_address VARCHAR(200),
    billing_city VARCHAR(100),
    billing_state VARCHAR(100),
    billing_country VARCHAR(100),
    billing_postal_code VARCHAR(20),
    total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Create the track table
CREATE TABLE track (
    track_id INT PRIMARY KEY,
    name VARCHAR(200),
    album_id INT,
    media_type_id INT,
    genre_id INT,
    composer VARCHAR(200),
    milliseconds INT,
    bytes INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (album_id) REFERENCES album(album_id),
    FOREIGN KEY (media_type_id) REFERENCES media_type(media_type_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

-- Create the playlist_track table
CREATE TABLE playlist_track (
    playlist_id INT,
    track_id INT,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
);

-- Create the invoice_line table
CREATE TABLE invoice_line (
    invoice_line_id INT PRIMARY KEY,
    invoice_id INT,
    track_id INT,
    unit_price DECIMAL(10, 2),
    quantity INT,
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
);
