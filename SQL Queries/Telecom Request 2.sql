select 
[gender],
count(*) as count_gender,
round(100.0*sum(case when Churn = 1 then 1 else 0 end)/ count(*), 2) as churn_percentage
from Churn
group by gender
order by gender asc;

Select
[InternetService],
count(*) as count_service,
round(100.0*sum(case when Churn = 1 then 1 else 0 end)/ count(*), 2) as churn_percentage
from Churn
group by [InternetService]
order by churn_percentage desc;

SELECT
  CASE 
    WHEN seniorcitizen = 1 THEN 'Senior'
    ELSE 'Non-Senior'
  END AS age_group,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    100.0 * SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END) / COUNT(*), 
    2
  ) AS churn_rate_percent
FROM Churn
GROUP BY CASE 
    WHEN seniorcitizen = 1 THEN 'Senior'
    ELSE 'Non-Senior'
  END

  order by churn_rate_percent desc

  Select
[TechSupport],
count(*) as count_tech,
round(100.0*sum(case when Churn = 1 then 1 else 0 end)/ count(*), 2) as churn_percentage
from Churn
group by [TechSupport]
order by churn_percentagee desc;

 Select
[Contract],
count(*) as count_contract,
round(100.0*sum(case when Churn = 1 then 1 else 0 end)/ count(*), 2) as churn_percentage
from Churn
group by [Contract]
order by churn_percentage desc;
