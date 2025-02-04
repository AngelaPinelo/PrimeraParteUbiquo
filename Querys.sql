-- Query No. 1
SELECT name, eye_color, hair_color FROM heroes.hero_information;

-- Query No. 2
SELECT p.publisher_name, COUNT(h.hero_id) as hero_count
FROM heroes.hero_information h
JOIN heroes.publisher p ON h.publisher_id = p.publisher_id
GROUP BY 
p.publisher_id,
p.publisher_name;

-- Query No. 3
SELECT h.name as hero_name, a.name as alignment_name, g.name as gender_name
FROM heroes.hero_information h
INNER JOIN heroes.alignment a ON a.alignment_id = h.alignment_id
INNER JOIN heroes.gender g ON g.gender_id = h.gender_id;

-- Query No. 4
SELECT h.name, p.publisher_name FROM heroes.hero_information h 
INNER JOIN heroes.publisher p on h.publisher_id = p.publisher_id
where h.eye_color IS NULL;

-- Query No. 5
SELECT h.name, p.publisher_name, h.weight FROM heroes.hero_information h 
INNER JOIN heroes.publisher p on h.publisher_id = p.publisher_id
where h.race IS NULL AND h.weight > 100;


-- Query No. 6
SELECT p.publisher_id, p.publisher_name, AVG(h.height) AS average_height
FROM heroes.hero_information h
INNER JOIN heroes.publisher p ON h.publisher_id = p.publisher_id
WHERE h.height IS NOT NULL
GROUP BY p.publisher_id, p.publisher_name;


-- Query No. 7
SELECT h.name, h.eye_color, p.publisher_name 
FROM heroes.hero_information h 
INNER JOIN heroes.publisher p ON p.publisher_id = h.publisher_id
WHERE h.eye_color IN (
SELECT eye_color
FROM heroes.hero_information
GROUP BY eye_color HAVING COUNT(*) = 1
);


-- Query No. 8
SELECT a.name AS alignment_name, g.name AS gender_name, COUNT(h.hero_id) AS hero_count
FROM heroes.hero_information h
INNER JOIN heroes.gender g ON h.gender_id = g.gender_id
INNER JOIN heroes.alignment a ON h.alignment_id = a.alignment_id
WHERE 
    h.alignment_id IN (
	SELECT 
		alignment_id
	FROM 
		heroes.hero_information
	GROUP BY 
		alignment_id
	HAVING 
		COUNT(hero_id) >= 10
    )
GROUP BY 
a.name, g.name
ORDER BY 
a.name, g.name;



