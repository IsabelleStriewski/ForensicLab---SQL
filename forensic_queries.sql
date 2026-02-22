/* Financial Crime Detection Queries
   Ziel: Identifizierung von verdächtigen Mustern 
*/
 
-- 1. ANALYSE: "Smurfing" (Geldwäsche-Verdacht)
-- Sucht nach Transaktionen, die knapp unter der Meldegrenze (z.B. 10.000€) liegen.
SELECT user_id, COUNT(*) as anzahl_transaktionen, SUM(amount) as gesamt_volumen
FROM transactions
WHERE amount BETWEEN 9000 AND 9999
GROUP BY user_id
HAVING anzahl_transaktionen > 2;
 
-- 2. ANALYSE: Brute-Force Detection
-- Findet IP-Adressen mit mehr als 5 fehlgeschlagenen Logins innerhalb eines Zeitraums.
SELECT ip_address, COUNT(*) as fehlversuche
FROM login_logs
WHERE status = 'FAILED'
GROUP BY ip_address
HAVING fehlversuche > 5;
 
-- 3. ANALYSE: Zeitliche Anomalien
-- Identifiziert Transaktionen, die zu ungewöhnlichen Zeiten (01:00 - 04:00 Uhr) getätigt wurden.
-- Nutzt die MySQL-Funktion HOUR(), um Nachtaktivitäten zu isolieren.
SELECT id, user_id, amount, timestamp
FROM transactions
WHERE HOUR(timestamp) BETWEEN 1 AND 4
ORDER BY timestamp DESC;
 
-- 4. ANALYSE: Mehrfach-Account-Nutzung (Schatten-Accounts)
-- Erkennt IPs, über die sich ungewöhnlich viele verschiedene User eingeloggt haben.
SELECT ip_address, COUNT(DISTINCT user_id) as nutzer_anzahl
FROM access_logs
GROUP BY ip_address
HAVING user_count > 3;
 
