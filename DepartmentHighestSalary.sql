#LeetCode 184
WITH top_salary AS (
    SELECT 
        name, 
        departmentId, 
        salary,
        RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS RankSalary
    FROM Employee
)
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM top_salary e
JOIN Department d 
    ON e.departmentId = d.id
WHERE e.RankSalary = 1
ORDER BY Salary DESC;
