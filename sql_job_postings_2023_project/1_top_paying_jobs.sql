


-- top 20 paying data_analyst roles from job postings that either remote jobes or in chosen arab countries
--and the names of the companies providing the roles :


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
 ;






