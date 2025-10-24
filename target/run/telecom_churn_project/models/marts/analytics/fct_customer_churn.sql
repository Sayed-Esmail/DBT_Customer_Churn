
  
    
    

    create  table
      "dev"."main"."fct_customer_churn__dbt_tmp"
  
    as (
      

select
  coalesce(zip_code, 'UNKNOWN') as zip_code,
  period_start,
  count(*) as customers,
  sum(churn_flag) as churned_customers,
  avg(monthly_charge) as avg_monthly_charge,
  avg(tenure_in_months) as avg_tenure,
  sum(total_revenue) as total_revenue
from "dev"."main"."int_customer_metrics"
group by zip_code, period_start
    );
  
  