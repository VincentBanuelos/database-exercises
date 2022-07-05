-- This will bring me into albums_db
USE albums_db;

-- 3. Explore the structure of the albums table.


-- a. How many rows are in the albums table? (A. 31)
-- This will allow me to see everything in the albums table
SELECT * FROM albums;
--  b. How many unique artists are there on this list? (A. 23)
-- This allows me to show mw how many unqie artists there are in albums.
SELECT COUNT(DISTINCT artist) FROM albums;
-- c. What is the primary key for album? (A. id)
DESCRIBE albums;
/* d.What is the oldest release date for any album in the albums table? What is the most recent release date?
(A. 1967, 2011) */

-- Write queries to find the following information:

-- The name of all albums by Pink Floyd
SELECT * 
FROM albums 
WHERE artist = 'Pink Floyd';

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT artist, release_date, name
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- The genre for the album Nevermind
SELECT artist, name, genre
FROM albums
WHERE name = 'Nevermind';

-- Which albums were released in the 1990s
SELECT name, release_date
FROM albums
WHERE release_date > 1990;

-- Which albums had less than 20 million certified sales
SELECT name, sales
FROM albums
WHERE sales < 20;

/* All the albums with a genre of "Rock". 
Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? */
SELECT name, genre
FROM albums
WHERE genre = 'Rock';
/* The genres of Hard Rock and Progressive Rock do not pull up because the querues only pulls 
for the exact match within the single quotes. */





 



