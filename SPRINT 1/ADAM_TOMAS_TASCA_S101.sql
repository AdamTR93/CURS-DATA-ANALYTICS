SELECT *
FROM company;

SELECT *
FROM transaction;
# EXERCICI 2
#Realitza la següent consulta: Has d'obtenir el nom, 
#email i país de cada companyia, ordena les dades en funció del nom de les companyies.
SELECT company_name, email, country
FROM company
ORDER BY company_name;

#EXERCICI 3
#Des de la secció de màrqueting et sol·liciten que els passis un llistat dels països que estan fent compres.

SELECT DISTINCT company.country
FROM company
JOIN transaction
ON company.id = transaction.company_id;

#EXERCICI 4
#Des de màrqueting també volen saber des de quants països es realitzen les compres.

SELECT COUNT(DISTINCT company.country) AS NumCountry
FROM company
JOIN transaction
ON company.id = transaction.company_id;

#EXERCICI 5
#El teu cap identifica un error amb la companyia que té aneu 'b-2354'.
#Per tant, et sol·licita que li indiquis el país i nom de companyia d'aquest aneu.
SELECT DISTINCT country, company_name
FROM company
WHERE company.id IN ('b-2354');

#EXERCICI 6
#A més, el teu cap et sol·licita que indiquis quina és la companyia amb major despesa mitjana?

SELECT company.company_name, AVG(transaction.amount) AS AverageAmount
FROM company
JOIN transaction
ON company.id = transaction.company_id
GROUP BY company.company_name
ORDER BY AVG(transaction.amount) DESC
LIMIT 1;

