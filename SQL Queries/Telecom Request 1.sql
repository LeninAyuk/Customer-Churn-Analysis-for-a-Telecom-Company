select tenure,
SUM(case when [Churn] = 1 then 1 else 0 end ) as sum_churn,
count(*) as customer_count,
round(100.0 * SUM(case when [Churn] = 1 then 1 else 0 end )/count(*), 2) as churn_percentage
from Churn
group by tenure 
order by tenure asc;

-- Overall churn percentage
select 
round(100.0*sum(case when Churn = 1 then 1 else 0 end)/ count(*), 2) as overall_churn_percentage
from Churn
