# SQL Forensic Lab - Financial Crime Analysis (MVP)
 
Dieses Projekt dokumentiert meine Herangehensweise, **SQL-Abfragen**, die speziell für die Analyse von Finanztransaktionen und Systemprotokollen entwickelt wurden, als Instrument der **digitalen Forensik** einzusetzen. Das Ziel war es, technische Logiken zu entwerfen, mit denen sich verdächtige Muster wie Geldwäsche oder unbefugte Systemzugriffe in Millionen von Datensätzen effizient aufspüren lassen.
 
---

## Analytische Schwerpunkte & Fallbeispiele
 
### 1. Detektion von Verschleierungstaktiken (Smurfing)
Im Bereich eDiscovery ist das Erkennen von bewussten Grenzwert-Unterschreitungen essenziell, um Geldwäsche-Versuche aufzudecken.
* **Methodik:** Identifizierung von Transaktionsketten, die systematisch knapp unter regulatorischen Meldegrenzen (z. B. 10.000 €) bleiben.
* **Technik:** Gezielte Filterung von Beträgen zwischen 9.000 € und 9.999 €, die gehäuft bei demselben Nutzer auftreten.
* **Fokus:** Aufdeckung von Mustern statt Einzelereignissen.
 
### 2. Identifizierung technischer Manipulationsversuche (Security Audit)
Systemprotokolle liefern die entscheidenden Spuren für unbefugte Zugriffe und Brute-Force-Angriffe.
* **Methodik:** Aggregation von fehlgeschlagenen Authentifizierungsereignissen zur Identifizierung von Angriffsmustern.
* **Technik:** Gruppierung von IP-Adressen mit einer kritischen Anzahl an „FAILED“-Status innerhalb kurzer Zeitintervalle.
* **Fokus:** Unterscheidung zwischen menschlichem Fehlverhalten und automatisierten Angriffen.
 
### 3. Analyse zeitlicher Verhaltensanomalien
In der Forensik ist der Faktor Zeit eines der wichtigsten Beweismittel, um unbefugte Aktivitäten einzugrenzen.
* **Methodik:** Untersuchung von Zugriffen, die signifikant vom normalen Nutzerverhalten abweichen.
* **Technik:** Filterung von Transaktionen oder Logins in kritischen Zeitfenstern (z. B. zwischen 01:00 und 04:00 Uhr morgens).
* **Fokus:** Nutzung von Zeitstempeln zur Rekonstruktion verdächtiger Ereignisketten.
 
### 4. Erkennung von Schatten-Accounts (Shared Device Fraud)
Angreifer nutzen oft dieselbe Infrastruktur für verschiedene Identitäten, um Entdeckungsmechanismen zu umgehen.
* **Methodik:** Suche nach IP-Adressen oder Geräte-IDs, über die auf eine ungewöhnlich hohe Anzahl verschiedener Konten zugegriffen wird.
* **Technik:** Einsatz von `COUNT(DISTINCT user_id)`, um Mehrfachnutzungen derselben Quelle zu isolieren.
* **Fokus:** Identifizierung von Account-Sharing und Identitätsmissbrauch.
 
---
 
## Technische Lernschritte & Methoden
 
* **Datenaggregation:** Sicherer Umgang mit `GROUP BY` und `HAVING`, um aus tausenden Datensätzen präzise Verdachtsfälle zu isolieren.
* **Filterlogik:** Nutzung von Operatoren wie `BETWEEN` und SQL-Zeitfunktionen (`strftime`), um komplexe Abfragebedingungen zu definieren.
* **Forensisches Mindset:** Die Fähigkeit, vage Verdachtsmomente in präzise technische SQL-Statements zu übersetzen.
 
---
 
## Warum dieses Projekt?
 
In diesem Repository zeige ich meine Arbeitsweise beim **Troubleshooting und der Datenanalyse**. Mein Ziel ist es nicht, Datenbanken nur zu verwalten, sondern sie forensisch zu durchdringen. 
 
Ich möchte verstehen, wie Unregelmäßigkeiten entstehen, um die passenden technischen Antworten und Schutzmechanismen zu liefern. SQL ist für mich das Werkzeug, um objektive Fakten aus komplexen Systemen zu extrahieren.
 
---
 
> **Status:** Lern-Prototyp (MVP) zur Demonstration forensischer Logik
> **Technologien:** SQL 
> **Hinweis:** Dies ist ein konzeptionelles Lernprojekt (MVP). Die Abfragen sind darauf ausgelegt, auf standardisierten Log-Datenbanken zu laufen.
 

