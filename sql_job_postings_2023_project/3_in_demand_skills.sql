-- top demanded skills for  data analyst role 


select skills , 
count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' 
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 6 ;

/* top demanded skills for  data analyst role 
-- where the job is remote (anywhere ) or the job_country is from the selected('Egypt','Kuwait'
 ,'Jordan','Saudi Arabia'
 ,'United Arab Emirates' ,'Qatar' ) */
 
select skills , 
count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and (job_country in  ('Egypt','Kuwait'
 ,'Jordan','Saudi Arabia'
 ,'United Arab Emirates' ,'Qatar' ) or job_location = 'Anywhere')  
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 6 ;
