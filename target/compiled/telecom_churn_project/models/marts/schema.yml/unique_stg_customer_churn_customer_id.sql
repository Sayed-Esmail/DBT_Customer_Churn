
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_customer_churn"
where customer_id is not null
group by customer_id
having count(*) > 1


