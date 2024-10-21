
{{ config(
    materialized='table'
) }}

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['Purpose']) }} as PurposeID,
		Purpose AS Purpose 
FROM {{ source('credit', 'raw_invoices') }}
WHERE Purpose  IS NOT NULL
