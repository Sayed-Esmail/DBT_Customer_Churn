select
  "Zip Code" as zip_code,
  cast(Population as integer) as population
from "dev"."main"."telecom_zipcode_population"