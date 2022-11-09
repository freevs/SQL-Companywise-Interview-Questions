### QUESTION
Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

### INPUT

*PAGES TABLE*

page_id|	name
--- |---
20001|	SQL Solutions
20045	|Brain Exercises
20701	|Tips for Data Analysts

*PAGE_LIKES TABLE*
user_id |	page_id	|liked_date
---|---|---|
111 |	20001	|04/08/2022 00:00:00
121	|20045	|03/12/2022 00:00:00
156	|20001	|07/25/2022 00:00:00

### OUTPUT
page_id|
---|
20701|

### EXPLANATION

The page with ID 20701 has no likes.

