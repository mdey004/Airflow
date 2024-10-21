


SELECT DISTINCT
    to_hex(md5(cast(coalesce(cast(`Loan Status` as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(Term as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as LoanStatusID,
	     `Loan Status` as LoanStatus,
         Term

FROM `airflowcrtn`.`credit`.`raw_invoices`