
    
    

select
    zip_code as unique_field,
    count(*) as n_records

from "dev"."main"."stg_zipcode_population"
where zip_code is not null
group by zip_code
having count(*) > 1


