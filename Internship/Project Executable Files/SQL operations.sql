select state from internship where no_of_manufactures > 100;
#total manufacture per year
SELECT Year, SUM(no_of_manufactures) AS total_manufacturers
FROM internship
GROUP BY Year
ORDER BY Year;
# Average
SELECT State, AVG(no_of_manufactures) AS avg_manufacturers
FROM internship
GROUP BY State
ORDER BY avg_manufacturers DESC;
#Maximum
SELECT Year, SUM(no_of_manufactures) AS total
FROM internship
GROUP BY Year
ORDER BY total DESC
LIMIT 1;
#Sub Queries
SELECT State, Year, no_of_manufactures
FROM internship i
WHERE no_of_manufactures > (
    SELECT AVG(no_of_manufactures)
    FROM internship AS sub
    WHERE sub.Year = i.Year
);

#IN operator
SELECT * 
FROM internship 
WHERE State IN ('California', 'Texas', 'New York');
#OR
SELECT * 
FROM internship 
WHERE State = 'California' OR Year = 2010;
#Between
SELECT * 
FROM internship 
WHERE no_of_manufactures BETWEEN 50 AND 100;
#Like
SELECT * 
FROM internship 
WHERE State LIKE 'New%';
#All
SELECT * 
FROM internship 
WHERE no_of_manufactures > ALL (
    SELECT no_of_manufactures 
    FROM internship 
    WHERE State = 'Alaska'
);
#Any
SELECT * 
FROM internship 
WHERE no_of_manufactures > ANY (
    SELECT no_of_manufactures 
    FROM internship 
    WHERE State = 'Alaska'
);
#Count function
SELECT COUNT(DISTINCT Year) AS total_years 
FROM internship;
#Union
SELECT State FROM internship WHERE "Number of Manufacture" > 100
UNION
SELECT State FROM internship WHERE "Number of Manufacture" < 50;
#Intersect
SELECT State FROM internship WHERE "Number of Manufacture" > 50
#Intersect
SELECT State FROM internship WHERE "Number of Manufacture" < 200;
#Inner Joins
SELECT a.State
FROM (SELECT DISTINCT State FROM internship WHERE "Number of Manufacture" > 50) a
JOIN (SELECT DISTINCT State FROM internship WHERE "Number of Manufacture" < 200) b
ON a.State = b.State;
#RowNumber()
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY State ORDER BY "Number of Manufacture" DESC) AS rank_in_state
FROM internship;
#Rank()
SELECT *,
       RANK() OVER (PARTITION BY State ORDER BY "Number of Manufacture" DESC) AS rank_in_state
FROM internship;
#Sum()
SELECT *,
       SUM("Number of Manufacture") OVER (PARTITION BY State ORDER BY Year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sum
FROM internship;











