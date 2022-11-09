### SOLUTION EXPLANATION

Candidates with a variety of skillsets have applied for this role, but we need candidates who know Python, Tableau, and PostgreSQL.

We'll start by using the IN operator to find candidates which have some of the required skills:

         SELECT candidate_id
         FROM candidates
         WHERE skill IN ('Python', 'Tableau', 'PostgreSQL'); 

The output should look something like this: (Showing random 5 records)

candidate_id |skill
--- | ---
123 |	Python
123	|Tableau
123	|PostgreSQL
345	|Python
345	|Tableau

We can see from the output that these candidates possess at least one of the necessary skills, but keep in mind, the problem is asking for candidates who have ALL THREE of these skills, so we aren't done quite yet!

It's important to keep in mind that the candidates table does not contain any duplicates, so each combination of candidate and skill is a unique row. Therefore, a candidate should have exactly 3 rows for each of the necessary skills in order to be qualified for the job.

Now, we group the candidates table by candidate ID using the GROUP BY clause and count the number of skills for each group using the COUNT function.

Let's look at the total number of required skills for each candidate:

        SELECT candidate_id, COUNT(skill) AS skill_count
        FROM candidates
        WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
        GROUP BY candidate_id;
        
Output:

candidate_id |	skill_count
--- |---
123	|3
345	|2

Candidate 123 possesses all three of the required skills in this instance, but Candidate 345 possesses only two of the required skills.

In the last step, we'll use HAVING to select only candidates with three skills and ORDER BY the candidate ID, as per the task.

Note that the full solution below counts skills inside the HAVING, not in the SELECT as shown above.

Full Solution:

       SELECT candidate_id
       FROM candidates
       WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
       GROUP BY candidate_id
       HAVING COUNT(skill) = 3
       ORDER BY candidate_id;
