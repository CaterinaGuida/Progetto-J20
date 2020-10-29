# URBAN PAVIA
## Emettitrice di biglietti e relativo sistema di controllo

Il progetto ha come obiettivo la realizzazione di un sistema per l’emissione e l'attivazione di titoli di viaggio per il servizio urbano di Pavia. Il progetto prevede anche la realizzazione di un sistema per il controllo della validità di un titolo di viaggio.

# ISTRUZIONI
## Creazione del database

1) Installare MySql Server e MySql Workbench: https://dev.mysql.com/downloads/installer/

2) Aprire MySql Workbench e creare una connessione (o utilizzare una connessione già esistente)

3) Cliccare (*File* -> *Open SQL Script...*) e selezionare lo script "*urban.sql*"

4) Eseguire lo script per creare il database e le rispettive tabelle

5) Cliccare (*File* -> *Open SQL Script...*) e selezionare lo script "*inspector.sql*"

6) Modificare i campi *name* e *pass* con delle credenziali a piacere (saranno le credenziali di accesso al sistema)

7) Eseguire lo script per aggiungere un nuovo controllore al database

## Esecuzione dell'applicazione

1) Scaricare ed installare Eclipse IDE for Enterprise Java Developers: https://www.eclipse.org/downloads/packages/

2) Scaricare ed installare Apache Tomcat 8.5: https://tomcat.apache.org/download-80.cgi

3) Aprire Eclipse e avviare il server

   3.1) Cliccare (*Window* -> *Preferences* -> *Server* -> *Runtime Environments* -> *Add*)

   3.2) Selezionare Apache Tomcat v8.5 e cliccare su *Next*

   3.3) Cliccare *Browse* e selezionare la directory in cui è stato installato Apache Tomcat 8.5
   
   3.4) Cliccare *Finish*

   3.5) Cliccare (*Window* -> *Show View* -> *Other...* -> *Server* -> *Servers* -> *Open*)

   3.6) Cliccare *No servers are available* nel riquadro in basso

   3.7) Cliccare (*Next* -> *Add* -> *Finish*)

   3.8) Fare doppio click su Tomcat v8.5 Server at localhost nel riquadro in basso

   3.9) Impostare il campo *Tomcat admin port* con 9090 e salvare

4) Importare il progetto in Eclipse: cliccare (*File* -> *Open Projects from File System*)

5) Cliccare *Directory...*, selezionare *urban*, cliccare *Selezione cartella* e infine *Finish*

6) Modificare le credenziali di accesso al database nella classe *DaoFactory*

6) Modificare il percorso del file logo.png nella classe *Receipt* (il file logo.png è in "Progetto-J20\urban\WebContent\static")

7) In *WebContent*, cliccare tasto destro su index.jsp, spostarsi su *Run As* e cliccare su *Run on Server*

8) Copiare il link su un browser
