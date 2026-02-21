/* PROJECT: Financial Crime Detection Queries
   GOAL: Identify suspicious patterns in banking and access logs.
*/
 
-- 1. ANALYSE: "Smurfing" (Geldwäsche-Verdacht)
-- Sucht nach Transaktionen, die knapp unter der Meldegrenze (z.B. 10.000€) liegen.
SELECT user_id, COUNT(*) as anzahl, SUM(amount) as gesamt_summe
FROM transactions
WHERE amount BETWEEN 9000 AND 9999
GROUP BY user_id
HAVING anzahl > 2;
 
-- 2. ANALYSE: Brute-Force Detection
-- Findet IP-Adressen mit mehr als 5 fehlgeschlagenen Logins innerhalb eines Zeitraums.
SELECT ip_address, COUNT(*) as fehlversuche
FROM login_logs
WHERE status = 'FAILED'
GROUP BY ip_address
HAVING fehlversuche > 5;
 
-- 3. ANALYSE: Zeitliche Anomalien
-- Identifiziert Transaktionen, die zu ungewöhnlichen Zeiten (01:00 - 04:00 Uhr) getätigt wurden.
SELECT transaction_id, user_id, amount, timestamp
FROM transactions
WHERE strftime('%H', timestamp) BETWEEN '01' AND '04'
ORDER BY timestamp DESC;
 
-- 4. ANALYSE: Mehrfach-Account-Nutzung
-- Erkennt IPs, über die sich ungewöhnlich viele verschiedene User eingeloggt haben.
SELECT ip_address, COUNT(DISTINCT user_id) as user_count
FROM access_logs
GROUP BY ip_address
HAVING user_count > 3;
 
