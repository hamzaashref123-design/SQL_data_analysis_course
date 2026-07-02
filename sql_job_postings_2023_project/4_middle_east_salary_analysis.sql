/*
the available jobs in the choosen country where information about salary is included
*/
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
 
 where job_country in  ('Egypt','Kuwait'
                        ,'Jordan','Saudi Arabia'
                        ,'United Arab Emirates' 
                        ,'Qatar','Bahrain','Iraq' 
                        ,'libya','Oman','Yamen' )   
 and salary_year_avg is NOT NULL 
-- AND job_title_short = 'Data Analyst'   -- remove the "-- " at the begining of the line for only including data analyst role
 ORDER BY 
 salary_year_avg DESC 



drop table  jobs_for_country ;
