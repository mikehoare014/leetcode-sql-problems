# Write your MySQL query statement below
SELECT score,
       dense_rank() OVER (ORDER BY score DESC) AS 'rank'
FROM scores


/*
Dense rank leaves no gaps as rank will. Also, RANK is a keyword i mysql, need te '' around rank to name that column. 
*/