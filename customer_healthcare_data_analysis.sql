select*from patients;
select*from region;
select*from service;
select*from table1;
select*from table2;
SELECT r.Name_ru AS 'Регион',CONCAT(p.First_name,' ',Second_name,' ',Last_name) AS 'ФИО',
CASE
WHEN p.gender=0 THEN "Мужской"
WHEN p.gender=1 THEN'Женский'
END AS 'Пол',
count(s.code) AS 'Кол-во услуги'
FROM patients P
JOIN region r
ON p.Id_region=r.id
JOIN service s
ON p.code_service = s.code
WHERE p.dt_reg BETWEEN '2024-01-01' AND '2024-05-31'
GROUP BY r.Name_ru, p.Last_name,p.First_name,p.Second_name,p.gender
ORDER BY r.Name_ru;
SELECT COUNT(*) AS count_iin
FROM table1 t1
JOIN table2 t2
ON t1.IIN = t2.IIN;
SELECT 
IIN, COUNT(*) AS count_iin
FROM
table1
GROUP BY IIN
HAVING COUNT(*) > 1;
SELECT IIN,count(*) AS count_iin
FROM table2
GROUP BY IIN
HAVING count(*)>1;
SELECT IIN,birth_date,
TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age
FROM table2
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 30 AND 70;