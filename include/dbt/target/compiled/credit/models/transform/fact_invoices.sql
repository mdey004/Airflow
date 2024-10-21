


WITH fct_invoices_cte AS (
    SELECT DISTINCT
        `Loan ID` AS LoanID,
        `Customer ID` AS CustomerID,
        to_hex(md5(cast(coalesce(cast(`Loan Status` as STRING), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(Term as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as LoanStatusID,
        to_hex(md5(cast(coalesce(cast(Purpose as STRING), '_dbt_utils_surrogate_key_null_') as STRING))) as PurposeID,
        `Current Loan Amount` AS CurrentLoanAmount,
        `Credit Score` AS CreditScore,
        `Annual Income` AS AnnualIncome,
        `Monthly Debt` AS MonthlyDebt,
        `Years of Credit History` AS YearsofCreditHistory,
        `Months since last delinquent` AS Monthssincelastdelinquent,
        `Number of Open Accounts` AS NumberofOpenAccounts,
        `Number of Credit Problems` AS NumberofCreditProblems,
        `Current Credit Balance` AS CurrentCreditBalance,
        `Maximum Open Credit` AS MaximumOpenCredit,
        `Bankruptcies` AS Bankruptcies,
        `Tax Liens` AS TaxLiens       
      
    FROM `airflowcrtn`.`credit`.`raw_invoices`
    
)
SELECT
   fi.*
FROM fct_invoices_cte fi
INNER JOIN `airflowcrtn`.`credit`.`dim_purpose` dt ON fi.PurposeID = dt.PurposeID
INNER JOIN `airflowcrtn`.`credit`.`dim_loanstatus` dp ON fi.LoanStatusID = dp.LoanStatusID
INNER JOIN `airflowcrtn`.`credit`.`dim_customer` dc ON fi.CustomerID = dc.CustomerID