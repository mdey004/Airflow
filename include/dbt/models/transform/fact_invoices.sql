{{ config(
    materialized='table'
) }}


WITH fct_invoices_cte AS (
    SELECT DISTINCT
        `Loan ID` AS LoanID,
        `Customer ID` AS CustomerID,
        {{ dbt_utils.generate_surrogate_key(['`Loan Status`', 'Term']) }} as LoanStatusID,
        {{ dbt_utils.generate_surrogate_key(['Purpose']) }} as PurposeID,
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
      
    FROM {{ source('credit', 'raw_invoices') }}
    
)
SELECT
   fi.*
FROM fct_invoices_cte fi
INNER JOIN {{ ref('dim_purpose') }} dt ON fi.PurposeID = dt.PurposeID
INNER JOIN {{ ref('dim_loanstatus') }} dp ON fi.LoanStatusID = dp.LoanStatusID
INNER JOIN {{ ref('dim_customer') }} dc ON fi.CustomerID = dc.CustomerID