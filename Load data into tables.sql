-- Load data into genre table
LOAD DATA INFILE 'music_store_csv_files/genre.csv'
INTO TABLE genre
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into artist table
LOAD DATA INFILE 'music_store_csv_files/artist.csv'
INTO TABLE artist
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Load data into album table
LOAD DATA INFILE 'music_store_csv_files/album.csv'
INTO TABLE album
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into media_type table
LOAD DATA INFILE 'music_store_csv_files/media_type.csv'
INTO TABLE media_type
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into playlist table
LOAD DATA INFILE 'music_store_csv_files/playlist.csv'
INTO TABLE playlist
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into employee table
LOAD DATA INFILE 'music_store_csv_files/employee.csv'
INTO TABLE employee
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Load data into customer table
LOAD DATA INFILE 'music_store_csv_files/customer.csv'
INTO TABLE customer
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Load data into invoice table
LOAD DATA INFILE 'music_store_csv_files/invoice.csv'
INTO TABLE invoice
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into track table
LOAD DATA INFILE 'music_store_csv_files/track.csv'
INTO TABLE track
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Load data into playlist_track table
LOAD DATA INFILE 'music_store_csv_files/playlist_track.csv'
INTO TABLE playlist_track
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Load data into invoice_line table
LOAD DATA INFILE 'music_store_csv_files/invoice_line.csv'
INTO TABLE invoice_line
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
