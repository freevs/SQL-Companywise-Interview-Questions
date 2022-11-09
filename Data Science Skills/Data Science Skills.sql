CREATE TABLE candidate (
  candidate_id integer,
  skill VARCHAR(30)
);
INSERT INTO candidate
  (candidate_id,skill)
VALUES
  (123,'Tableau'),
  (123,'PostgreSQL'),
  (234,'R'),
  (234,'PowerBI'),
  (234,'SQL Server'),
  (345,'Python'),
  (345,'Tableau'),
  (147,'Python'),
  (147,'PostgreSQL'),
  (147,'Tableau'),
  (147,'Java'),
  (168,'Python'),
  (256,'Tableau');

select candidate_id
from candidate
where skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
having count(*)=3
