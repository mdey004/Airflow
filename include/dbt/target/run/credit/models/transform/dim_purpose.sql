
  
    

    create or replace table `airflowcrtn`.`credit`.`dim_purpose`
      
    
    

    OPTIONS()
    as (
      

SELECT DISTINCT
    to_hex(md5(cast(coalesce(cast(Purpose as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as PurposeID,
		Purpose AS Purpose 
FROM `airflowcrtn`.`credit`.`raw_invoices`
WHERE Purpose  IS NOT NULL
    );
  