{{ config(
    materialized='table'
) }}

SELECT distinct
    `Customer ID` AS customerid,
    `Years in Current Job` AS years_in_current_job,
    `Home Ownership` AS home_ownership
FROM {{ source('credit', 'raw_invoices') }}  -- Reference to the source defined in sources.yml
WHERE `Customer ID` IS NOT NULL 
	