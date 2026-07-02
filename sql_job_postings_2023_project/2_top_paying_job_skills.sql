/* creating table for top requierd skills for data analyst for the top paying positions  :*/


CREATE table skills_count as(


with top_paying_skills as (

SELECT
job_id ,
job_title_short,
job_location,
salary_year_avg,
job_country,
 company_dim.name as company_name
from job_postings_fact
 LEFT JOIN company_dim
 ON company_dim.company_id = job_postings_fact.company_id 
  where (job_country in
    ('Egypt','Kuwait'
     ,'Jordan','Saudi Arabia'
     ,'United Arab Emirates' ,'Qatar' ) or job_location = 'Anywhere')
  AND job_title_short = 'Data Analyst' 
  AND salary_year_avg IS NOT NULL 
 ORDER BY salary_year_avg DESC
 limit 20
)


SELECT top_paying_skills.* ,
skills_dim.skills
from top_paying_skills
INNER JOIN skills_job_dim on top_paying_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
)
;


-- showing the results for the above table 

SELECT * from skills_count;


/* from the table created above we can analyze the top needed 10 skills for 
the highest paying  jobs either (remotly ((anywhere)) or in our choosen countries )*/

SELECT count(skills) as top_needed ,
skills
 FROM skills_count
 GROUP BY skills
 ORDER BY top_needed DESC
 limit 10
;   