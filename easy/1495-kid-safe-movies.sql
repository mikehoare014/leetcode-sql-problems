SELECT DISTINCT title
FROM tvprogram p
JOIN content c USING (content_id)
WHERE DATE_FORMAT(program_date, '%Y-%m') = '2020-06'
AND content_type = 'Movies'
AND kids_content = 'Y';