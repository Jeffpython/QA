-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами

SELECT e.employee_name, s.monthly_salary
FROM employee_salary es
JOIN salary s ON s.id = es.salary_id
JOIN employees e ON e.id = es.employee_id

-- 2. Вывести всех работников у которых ЗП меньше 2000

SELECT e.employee_name, s.monthly_salary
FROM employee_salary es
JOIN salary s ON s.id = es.salary_id
JOIN employees e ON e.id = es.employee_id
WHERE s.monthly_salary < 2000

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен (ЗП есть, но не понятно кто её получает)

SELECT s.monthly_salaryД
FROM employee_salary es
LEFT JOIN employees e ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id 
WHERE e.id IS NULL

-- 4. Вывести все зарплатные позиции меньше 2000, но работник по ним не назначен (ЗП есть, но не понятно кто её получает)

SELECT s.monthly_salary 
FROM employee_salary es 
LEFT JOIN employees e ON e.id = es.employee_id 
JOIN salary s ON s.id = es.salary_id
WHERE e.id IS NULL AND s.monthly_salary < 2000

-- 5. Найти всех работников кому не начислена ЗП

SELECT employee_name
FROM employees e
LEFT JOIN employee_salary es ON es.employee_id = e.id
WHERE es.salary_id IS NULL

-- 6. Вывести всех работников с названиями их должности

SELECT e.employee_name, r.role_name
FROM roles_employee re
JOIN employees e ON e.id = re.employee_id
JOIN roles r ON r.id = re.role_id

-- 7. Вывести имена и должность только Java разработчиков

SELECT e.employee_name, r.role_name
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 

-- 8. Вывести имена и должность только Python разработчиков

SELECT e.employee_name, r.role_name 
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
WHERE r.role_name LIKE '%Python developer'

-- 9. Вывести имена и должность всех QA инженеров

SELECT e.employee_name, r.role_name
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
WHERE r.role_name LIKE '%QA engineer'

-- 10. Вывести имена и должность ручных QA инженеров

SELECT e.employee_name, r.role_name 
FROM roles_employee re 
LEFT JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
WHERE r.role_name LIKE '%Manual QA engineer'

-- 11. Вывести имена и должность автоматизаторов QA

SELECT e.employee_name, r.role_name 
FROM roles_employee re
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
WHERE r.role_name LIKE '%Automation QA engineer'

-- 12. Вывести имена и зарплаты Junior специалистов

SELECT e.employee_name, s.monthly_salary
FROM roles_employee re
JOIN roles r ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id 
LEFT JOIN employee_salary es ON es.employee_id = re.employee_id 
LEFT JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE 'Junior%'

-- 13. Вывести имена и зарплаты Middle специалистов

SELECT e.employee_name, s.monthly_salary 
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id
JOIN roles r ON r.id = re.role_id 
LEFT JOIN employee_salary es ON es.employee_id = re.employee_id 
LEFT JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE 'Middle%'

-- 14. Вывести имена и зарплаты Senior специалистов

SELECT e.employee_name, s.monthly_salary 
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id
JOIN roles r ON r.id = re.role_id 
LEFT JOIN employee_salary es ON es.employee_id = re.employee_id 
LEFT JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE 'Senior%' 

-- 15. Вывести зарплаты Java разработчиков

SELECT s.monthly_salary
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id 
LEFT JOIN employee_salary es ON es.employee_id = re.employee_id 
LEFT JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE '%Java developer'

-- 16. Вывести зарплаты Python разработчиков

SELECT s.monthly_salary
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id 
LEFT JOIN employee_salary es ON es.employee_id = re.employee_id 
LEFT JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE '%Python developer'

-- 17. Вывести имена и зарплаты Junior Python разработчиков

SELECT r.role_name, s.monthly_salary
FROM roles_employee re
JOIN roles r ON r.id = re.role_id
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name = 'Junior Python developer'

-- 18. Вывести имена и зарплаты Middle JS разработчиков

SELECT r.role_name, s.monthly_salary
FROM roles_employee re
JOIN roles r ON r.id = re.role_id
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name = 'Middle JavaScript developer'

-- 19. Вывести имена и зарплаты Senior Java разработчиков

SELECT r.role_name, s.monthly_salary
FROM roles_employee re
JOIN roles r ON r.id = re.role_id
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name = 'Senior Java developer'

-- 20. Вывести зарплаты Junior QA инженеров

SELECT s.monthly_salary
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE 'Junior%QA engineer'

-- 21. Вывести среднюю зарплату всех Junior специалистов

SELECT avg(s.monthly_salary)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE 'Junior%'

-- 22. Вывести сумму зарплат JS разработчиков

SELECT sum(s.monthly_salary)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE '%JavaScript developer'

-- 23. Вывести минимальную ЗП QA инженеров

SELECT min(s.monthly_salary)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE '%QA engineer'

-- 24. Вывести максимальную ЗП QA инженеров

SELECT max(s.monthly_salary)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE '%QA engineer'

-- 25. Вывести количество QA инженеров

SELECT count(r.id)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
WHERE r.role_name LIKE '%QA engineer'

-- 26. Вывести количество Middle специалистов

SELECT count(r.id)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
WHERE r.role_name LIKE 'Middle%'

-- 27. Вывести количество разработчиков

SELECT count(r.id)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
WHERE r.role_name LIKE '%developer'

-- 28. Вывести фонд (сумму) зарплаты разработчиков

SELECT sum(s.monthly_salary)
FROM roles_employee re 
JOIN roles r ON r.id = re.role_id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name LIKE '%developer'

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

SELECT e.employee_name, r.role_name, s.monthly_salary
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
LEFT JOIN employee_salary es ON es.employee_id = re.employee_id 
LEFT JOIN salary s ON s.id = es.salary_id
ORDER BY s.monthly_salary

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

SELECT e.employee_name, r.role_name, s.monthly_salary
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
JOIN employee_salary es ON es.employee_id = re.employee_id 
JOIN salary s ON s.id = es.salary_id
WHERE s.monthly_salary BETWEEN 1700 AND 2300
ORDER BY s.monthly_salary

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

SELECT e.employee_name, r.role_name, s.monthly_salary
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
JOIN employee_salary es ON es.employee_id = re.employee_id 
JOIN salary s ON s.id = es.salary_id
WHERE s.monthly_salary < 2300
ORDER BY s.monthly_salary

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

SELECT e.employee_name, r.role_name, s.monthly_salary
FROM roles_employee re 
JOIN employees e ON e.id = re.employee_id 
JOIN roles r ON r.id = re.role_id 
JOIN employee_salary es ON es.employee_id = re.employee_id 
JOIN salary s ON s.id = es.salary_id
WHERE s.monthly_salary IN (1100, 1500, 2000)
ORDER BY s.monthly_salary