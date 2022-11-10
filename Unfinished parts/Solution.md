### SOLUTION

The parts table already contains all of the parts that are currently in production, meaning that we do not have to do any additional filtering for the parts that are not in production.

All we need to do is extract the parts that are not yet finished. We can accomplish this by filtering for rows with no data present in the finish_date column. We call these missing values NULL.

Some parts might be represented multiple times in the query data because they have several assembly steps that are not yet complete. To solve this, we can group part to obtain the unique parts.

    SELECT part
    FROM parts_assembly
    WHERE finish_date IS NULL
    GROUP BY part;

