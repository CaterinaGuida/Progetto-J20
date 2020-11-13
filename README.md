# URBAN PAVIA
## Emettitrice di biglietti e relativo sistema di controllo

Il progetto ha come obiettivo la realizzazione di un sistema per l’emissione e l'attivazione di titoli di viaggio per il servizio urbano di Pavia. Il progetto prevede anche la realizzazione di un sistema per il controllo della validità di un titolo di viaggio.

# ISTRUZIONI
## Creazione del database

1) Installare **MySql Server** e **MySql Workbench**: https://dev.mysql.com/downloads/installer/

2) Aprire MySql Workbench e creare una connessione (o utilizzare una connessione già esistente)

3) Scaricare il file "*database.sql*": https://drive.google.com/file/d/1NF9f0mxsXE0hZQPKvRU5ne3YabsMNsRf/view?usp=sharing

4) Cliccare (*File* -> *Open SQL Script...*) e selezionare il file "*database.sql*"

5) Eseguire lo script per creare il database e le rispettive tabelle

6) Scaricare il file "*query.sql*": https://drive.google.com/file/d/1omBZLG81_hYIxg5d07wREhcwIdiGiFeX/view?usp=sharing

7) Cliccare (*File* -> *Open SQL Script...*) e selezionare lo script "*query.sql*"

8) Creare un nuovo **controllore**, sostituendo ai campi *name* e *pass* le proprie credenziali di accesso al sistema (scelte a piacere)

9) Eseguire lo script per aggiungere il nuovo controllore al database

## Avvio del server

1) Scaricare ed installare **Eclipse IDE for Enterprise Java Developers**: https://www.eclipse.org/downloads/packages/

2) Scaricare ed installare **Apache Tomcat 8.5**: https://tomcat.apache.org/download-80.cgi

3) Aprire Eclipse

   3.1) Cliccare (*Window* -> *Preferences* -> *Server* -> *Runtime Environments* -> *Add*)

   3.2) Selezionare *Apache Tomcat v8.5* e cliccare su *Next*

   3.3) Cliccare *Browse* e selezionare la directory in cui è stato installato Apache Tomcat 8.5
   
   3.4) Cliccare *Finish*

   3.5) Cliccare (*Window* -> *Show View* -> *Other...* -> *Server* -> *Servers* -> *Open*)

   3.6) Cliccare *No servers are available* nel riquadro che compare in basso

   3.7) Cliccare (*Next* -> *Add* -> *Finish*)

   3.8) Fare doppio click su *Tomcat v8.5 Server at localhost* nel riquadro in basso

   3.9) Impostare il campo *Tomcat admin port* con **9090** e salvare

## Esecuzione dell'applicazione

1) Importare il progetto in Eclipse: cliccare (*File* -> *Open Projects from File System*)

2) Cliccare *Directory...*, selezionare la cartella contenente il progetto, cliccare *Selezione cartella* e infine *Finish*

3) **Modificare le credenziali di accesso al database nella classe *DaoFactory***, sostituendo a *root* e a *Mateodima7* le proprie

4) **Modificare il percorso del file *logo.png* nella classe *Receipt* (il file *logo.png* si trova in "Progetto-J20\WebContent\static")**

5) A questo punto, cliccare con il tasto destro su *index.jsp*, spostarsi su *Run As* e cliccare su *Run on Server*

6) Per una migliore visualizzazione, fare copia e incolla del link (http://localhost:8080/urban/index.jsp) su un browser

# LIBRERIE UTILIZZATE

1) ITEXTPDF v. 5.5.9

2) JUNIT 5

3) MYSQL-CONNECTOR-JAVA v. 8.0.21

4) SERVLET-API
