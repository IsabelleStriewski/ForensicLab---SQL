# SQL Forensic Lab - Financial Crime Analysis (MVP)
 
Dieses Projekt enthält eine Sammlung von **forensischen SQL-Abfragen**, die speziell für die Analyse von Finanztransaktionen und Systemprotokollen entwickelt wurden. Das Ziel war es, technische Logiken zu entwerfen, mit denen sich verdächtige Muster wie Geldwäsche oder unbefugte Systemzugriffe in Massendaten effizient aufspüren lassen.
 
---
 
## Kernfunktionen & Analyse-Schwerpunkte
 
### 1. Geldwäsche-Prävention (Smurfing Detection)
Das Skript identifiziert das sogenannte „Smurfing“-Muster. Hierbei werden gezielt Transaktionen gesucht, die knapp unter der gesetzlichen Meldegrenze (z. B. 10.000 €) liegen, um manuelle Prüfungen zu umgehen.
* **Technik:** Filtert Beträge zwischen 9.000 € und 9.999 €, die gehäuft bei demselben Nutzer auftreten.
* **Ziel:** Aufdeckung systematischer Stückelung von Geldbeträgen.
 
### 2. IT-Sicherheits-Audit (Brute-Force Detection)
Zur Überprüfung der Integrität von Systemzugängen analysiert das Tool Login-Protokolle auf Anomalien.
* **Verfahren:** Identifizierung von IP-Adressen mit einer kritischen Anzahl an fehlgeschlagenen Login-Versuchen innerhalb kurzer Zeitintervalle.
 
### 3. Zeitliche Anomalie-Erkennung
Ermittlung von Aktivitäten, die außerhalb der üblichen Geschäftszeiten oder Nutzergewohnheiten stattfinden.
* **Fokus:** Transaktionen oder Systemzugriffe zwischen 01:00 und 04:00 Uhr morgens, was oft auf automatisierte Angriffe oder unbefugte Zugriffe hindeutet.
 
### 4. Erkennung von Schatten-Accounts
Suche nach IP-Adressen, über die auf eine ungewöhnlich hohe Anzahl verschiedener Nutzerkonten zugegriffen wird (Shared Device Fraud).
 
---
 
## Technische Lernschritte & Methoden
 
* **Datenaggregation:** Sicherer Umgang mit `GROUP BY` und `HAVING`, um aus tausenden Datensätzen präzise Verdachtsfälle zu isolieren.
* **Filterlogik:** Nutzung von Operatoren wie `BETWEEN` und SQL-Zeitfunktionen (`strftime`), um komplexe Abfragebedingungen zu definieren.
* **Forensisches Mindset:** Die Fähigkeit, vage Verdachtsmomente in präzise technische SQL-Statements zu übersetzen.
 
---
 
## Warum dieses Projekt?
 
In Bereichen wie **Anti-Financial Crime**, **Audit** oder **eDiscovery** ist SQL das wichtigste Werkzeug, um „die Nadel im Heuhaufen“ zu finden. Mit diesem Repository zeige ich meine Fähigkeit, Daten nicht nur abzufragen, sondern sie gezielt unter dem Aspekt der Sicherheit und Integrität zu analysieren.
 
> **Hinweis:** Dies ist ein konzeptionelles Lernprojekt (MVP). Die Abfragen sind darauf ausgelegt, auf standardisierten Log-Datenbanken (z. B. SQLite oder PostgreSQL) zu laufen.
 
---
 
## Über das Projekt
Mit diesem SQL-Lab vervollständige ich mein **"Forensik-Triple"** auf GitHub:
1. **Dateiebene:** Forensic Metadata Extractor (Python)
2. **Systemebene:** Linux Security Auditor (Bash)
3. **Datenebene:** Financial Crime Analysis (SQL)
 
