### SOLUTION

There are two ways to go about it. Either LEFT JOIN or RIGHT JOIN can be established between tables pages and page_likes or a subquery can be used to identify which pages have not been liked by any user.

The LEFT JOIN clause starts selecting data from the left table. For each row in the left table (pages), it compares the value in the page_id column with the value of each row in the page_id column in the right table (page_likes).

When page_id are found on both sides, the LEFT JOIN clause creates a new row that contains columns that appear in the SELECT clause and adds this row to the result set.

In case page_id frompages table is not available in page_likes table, the LEFT JOIN clause also creates a new row that contains columns that appear in the SELECT clause. In addition, it fills the columns that come from the page_likes (right table) with NULL. Rows having NULL values in the result is the set of the solution.

### Solution #1: Using LEFT OUTER JOIN

      SELECT pages.page_id
      FROM pages
      LEFT OUTER JOIN page_likes AS likes
      ON pages.page_id = likes.page_id
      WHERE likes.page_id IS NULL;
      
### Solution #2: Using NOT EXISTS clause

      SELECT page_id
      FROM pages
      WHERE NOT EXISTS 
                    (SELECT 1
                     FROM page_likes AS likes
                     WHERE likes.page_id = pages.page_id);
