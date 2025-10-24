
with base as (
  select
    customer_id,
    zip_code,
    period_start,
    tenure_in_months,
    monthly_charge,
    total_revenue,
    case when lower(customer_status) = 'churned' then 1 else 0 end as churn_flag
  from "dev"."main"."stg_customer_churn"
)
select
  customer_id,
  zip_code,
  period_start,
  tenure_in_months,
  monthly_charge,
  total_revenue,
  churn_flag
from base