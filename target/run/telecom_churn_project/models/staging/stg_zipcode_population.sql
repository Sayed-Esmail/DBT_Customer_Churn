
  
  create view "dev"."main"."stg_zipcode_population__dbt_tmp" as (
    select
  "Zip Code" as zip_code,
  cast(Population as integer) as population
from "dev"."main"."telecom_zipcode_population"
  );
