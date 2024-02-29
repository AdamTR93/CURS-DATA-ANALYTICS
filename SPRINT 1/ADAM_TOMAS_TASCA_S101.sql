#NIVELL 1
#EXERCICI 2
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
#El teu cap identifica un error amb la companyia que té ID 'b-2354'.
#Per tant, et sol·licita que li indiquis el país i nom de companyia d'aquest id.
SELECT DISTINCT country, company_name
FROM company
WHERE company.id IN ('b-2354');


#EXERCICI 6
#A més, el teu cap et sol·licita que indiquis quina és la companyia amb major despesa mitjana?

SELECT company.company_name, AVG(transaction.amount) AS AverageAmount
FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE declined = 0
GROUP BY company.company_name
ORDER BY AVG(transaction.amount) DESC
LIMIT 1;

#NIVELL 2
#EXERCICI 1
#El teu cap està redactant un informe de tancament de l'any i et sol·licita
#que li enviïs informació rellevant per al document.
#Per a això et sol·licita verificar si en la base de dades
#existeixen companyies amb identificadors (ID) duplicats.

SELECT id, COUNT(id)
FROM company
GROUP BY id
HAVING COUNT(id)>1;


#EXERCICI 2
#En quin dia es van realitzar les cinc vendes més costoses?
#Mostra la data de la transacció i la sumatòria de la quantitat de diners.

SELECT DATE(timestamp) AS Date, SUM(amount) AS Amount
FROM transaction
WHERE declined = 0
GROUP BY DATE(timestamp)
ORDER BY SUM(amount) DESC 
LIMIT 5;


#EXERCICI 3
#En quin dia es van realitzar les cinc vendes de menor valor?
#Mostra la data de la transacció i la sumatòria de la quantitat de diners.

SELECT DATE(timestamp) AS Date, SUM(amount) AS Amount
FROM transaction
WHERE declined = 0
GROUP BY DATE(timestamp)
ORDER BY SUM(amount)
LIMIT 5;

#EXERCICI 4
#Quina és la mitjana de despesa per país? Presenta els resultats ordenats de major a menor mitjà.

SELECT company.country, AVG(transaction.amount) AS CountryAmount
FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE declined = 0
GROUP BY company.country
ORDER BY CountryAmount DESC;

#NIVELL 3
#EXERCICI 1
#Presenta el nom, telèfon i país de les companyies, juntament amb la quantitat total gastada,
#d'aquelles que van realitzar transaccions amb una despesa compresa entre 100 i 200 euros.
#Ordena els resultats de major a menor quantitat gastada.

SELECT company.company_name, company.phone, company.country, SUM(transaction.amount) as Amount
FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE transaction.amount BETWEEN 100 AND 200
AND declined = 0
GROUP BY company.id
ORDER BY SUM(transaction.amount) DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

#EXERCICI 2
#Indica el nom de les companyies que van fer compres el
#16 de març del 2022, 28 de febrer del 2022 i 13 de febrer del 2022.

SELECT company.company_name, transaction.timestamp
FROM company
JOIN transaction
ON company.id = transaction.company_id
WHERE declined = 0 
AND DATE(transaction.timestamp) IN ('2022-03-16', '2022-02-28', '2022-02-13')
ORDER BY transaction.timestamp DESC;


