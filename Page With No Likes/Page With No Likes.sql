CREATE TABLE pages (
  id int,
  name VARCHAR(255)
);
INSERT INTO pages
  (id,name)
VALUES
  (20045,'Brain Exercises'),
  (20701,'Tips for Data Analysts'),
  (31111,'Postgres Crash Course'),
  (32728,'Break the thread');

CREATE TABLE page_likes (
  user_id INT,
  page_id INT,
  liked_date datetime
);
INSERT INTO page_likes
  (user_id, page_id,liked_date)
VALUES
  (121,20045,'2022-03-12'),
  (156,20001,'2022-07-25'),
  (255,20045,'2022-07-19'),
  (125,20001,'2022-07-19'),
  (144,31111,'2022-06-21'),
  (125,31111,'2022-07-04');
  
  select id from pages where id not in 
  (select page_id from page_likes);
  
SELECT p.id
FROM pages p
LEFT OUTER JOIN page_likes q
ON p.id = q.page_id
WHERE q.page_id IS NULL;
