--list of architects and cheapest house plans designed by them,
--which house build cost is between 300000 and 600000.

SELECT a.first_name, a.second_name, p.p_name, p.plan_price 
FROM architect a LEFT JOIN house_plan p ON a.id_architect = p.id_plan 
WHERE p.build_cost BETWEEN 300000 AND 600000 ORDER BY p.plan_price ASC;


--architects whose house plans average price is more expensive than average 
--plan price of all house plans.

SELECT a.first_name, a.second_name, AVG(p.plan_price) AS avg_price 
FROM architect a JOIN house_plan p ON a.id_architect = p.id_plan
GROUP BY a.first_name, a.second_name 
HAVING AVG(p.plan_price) >= (SELECT AVG(plan_price) FROM house_plan);

--list and count of most frequent selling house plans.

SELECT p.p_name, COUNT(s.pplan_id_plan) AS "count_top" 
FROM house_plan p JOIN sold_plans s 
ON p.id_plan = s.pplan_id_plan 
GROUP BY p.p_name, p.id_plan 
ORDER BY count_top DESC;

--names of architects that designed house plans of houses that buid cost exceeds 400k

SELECT first_name, second_name FROM architect 
WHERE id_architect IN (SELECT DISTINCT id_architect FROM house_plan WHERE build_cost>400000);
