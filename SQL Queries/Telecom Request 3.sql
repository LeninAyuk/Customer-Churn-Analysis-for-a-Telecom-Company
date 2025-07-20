WITH CustomerChurnStatus AS (
    SELECT 
        CustomerID,
        Tenure,
        MonthlyCharges,
        Contract,
        TechSupport,
        OnlineSecurity,
        InternetService,
        Churn,
        CASE 
            WHEN Churn = 1 AND Tenure <= 6 THEN 'Early Churn'
            WHEN Churn = 1 AND Tenure > 6 THEN 'Late Churn'
            ELSE 'Not Churned'
        END AS ChurnTiming
    FROM Churn
)

-- Step 2: Query 1 - Early Churn by Contract
SELECT 
    'Early Churn by Contract' AS Analysis,
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END) AS Early_Churned,
    ROUND(
        100.0 * SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS Early_Churn_Percentage
FROM CustomerChurnStatus
GROUP BY Contract

UNION ALL

-- Step 3: Query 2 - Monthly Charges by Churn Timing
SELECT 
    'Avg Monthly Charges by Churn Timing' AS Analysis,
    ChurnTiming AS Category,
    COUNT(*) AS Total_Customers,
    NULL AS Early_Churned,
    ROUND(AVG(MonthlyCharges), 2) AS Value
FROM CustomerChurnStatus
WHERE ChurnTiming IN ('Early Churn', 'Late Churn')
GROUP BY ChurnTiming

UNION ALL

-- Step 4: Query 3 - Early Churn by Tech Support
SELECT 
    'Early Churn by TechSupport' AS Analysis,
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END),
    ROUND(
        100.0 * SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    )
FROM CustomerChurnStatus
GROUP BY TechSupport

UNION ALL

-- Step 5: Query 4 - Early Churn by Online Security
SELECT 
    'Early Churn by OnlineSecurity' AS Analysis,
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END),
    ROUND(
        100.0 * SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    )
FROM CustomerChurnStatus
GROUP BY OnlineSecurity

UNION ALL

-- Step 6: Query 5 - Early Churn by Internet Service
SELECT 
    'Early Churn by InternetService' AS Analysis,
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END),
    ROUND(
        100.0 * SUM(CASE WHEN ChurnTiming = 'Early Churn' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    )
FROM CustomerChurnStatus
GROUP BY InternetService;
