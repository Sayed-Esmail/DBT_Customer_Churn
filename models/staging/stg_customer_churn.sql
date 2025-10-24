with src as (

  -- During dev we point at the sample seed
  select * from {{ ref('telecom_customer_churn_sample') }}

  -- For production, swap to:
  -- select * from {{ source('raw','telecom_customer_churn') }}

),

norm as (

select
  "Customer ID"                                    as customer_id,
  "Gender"                                         as gender,
  try_cast("Age" as integer)                       as age,
  "Married"                                        as married,
  try_cast("Number of Dependents" as integer)      as number_of_dependents,
  "City"                                           as city,
  trim(cast("Zip Code" as varchar))                as zip_code,
  try_cast("Latitude" as double)                   as latitude,
  try_cast("Longitude" as double)                  as longitude,
  try_cast("Number of Referrals" as integer)       as number_of_referrals,
  try_cast("Tenure in Months" as integer)          as tenure_in_months,
  "Offer"                                          as offer,
  "Phone Service"                                  as phone_service,
  try_cast("Avg Monthly Long Distance Charges" as double) as avg_monthly_long_distance_charges,
  "Multiple Lines"                                 as multiple_lines,
  "Internet Service"                               as internet_service,
  "Internet Type"                                  as internet_type,
  try_cast("Avg Monthly GB Download" as double)    as avg_monthly_gb_download,
  "Online Security"                                as online_security,
  "Online Backup"                                  as online_backup,
  "Device Protection Plan"                         as device_protection_plan,
  "Premium Tech Support"                           as premium_tech_support,
  "Streaming TV"                                   as streaming_tv,
  "Streaming Movies"                               as streaming_movies,
  "Streaming Music"                                as streaming_music,
  "Unlimited Data"                                 as unlimited_data,
  "Contract"                                       as contract,
  "Paperless Billing"                              as paperless_billing,
  "Payment Method"                                 as payment_method,
  try_cast("Monthly Charge" as double)             as monthly_charge,
  try_cast("Total Charges" as double)              as total_charges,
  try_cast("Total Refunds" as double)              as total_refunds,
  try_cast("Total Extra Data Charges" as double)   as total_extra_data_charges,
  try_cast("Total Long Distance Charges" as double) as total_long_distance_charges,
  try_cast("Total Revenue" as double)              as total_revenue,
  "Customer Status"                                as customer_status,
  "Churn Category"                                 as churn_category,
  "Churn Reason"                                   as churn_reason,
  cast('{{ var("analysis_period_start", "2022-04-01") }}' as date) as period_start,
  cast('{{ var("analysis_period_end", "2022-06-30") }}' as date)   as period_end

from src

)

select * from norm