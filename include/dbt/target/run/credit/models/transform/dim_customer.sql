
  
    

    create or replace table `airflowcrtn`.`credit`.`dim_customer`
      
    
    

    OPTIONS()
    as (
      

SELECT distinct
    `Customer ID` AS customerid,
    `Years in Current Job` AS years_in_current_job,
    `Home Ownership` AS home_ownership
FROM `airflowcrtn`.`credit`.`raw_invoices`  -- Reference to the source defined in sources.yml
WHERE `Customer ID` IS NOT NULL
    );
  