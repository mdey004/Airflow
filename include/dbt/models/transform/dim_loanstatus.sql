{{ config(
    materialized='table'
) }}


SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['`Loan Status`', 'Term']) }} as LoanStatusID,
	     `Loan Status` as LoanStatus,
         Term

FROM {{ source('credit', 'raw_invoices') }}
