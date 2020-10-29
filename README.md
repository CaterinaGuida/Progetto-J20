# URBAN PAVIA
## Emettitrice di biglietti e relativo sistema di controllo

Il progetto ha come obiettivo la realizzazione di un sistema per l’emissione e l'attivazione di titoli di viaggio per il servizio urbano di Pavia. Il progetto prevede anche la realizzazione di un sistema per il controllo della validità di un titolo di viaggio.

# ISTRUZIONI
## Creazione del database

1) Installare MySql Server e MySql Workbench: https://dev.mysql.com/downloads/installer/
2) Aprire MySql Workbench e avviare/creare la propria connessione
3) Eseguire lo script "urban.sql" per creare il database e le rispettive tabelle
4) Aprire lo script "inspector.sql" per aggiungere un controllore
   4a) Scegliere uno *username* e una *password* e sostituire tali valori al posto di *name* e *pass* rispettivamente
5) Eseguire lo script "inspector.sql" per aggiungere il controllore al database

## Esecuzione dell'applicazione

1) Scaricare ed installare Eclipse IDE for Enterprise Java Developers: https://www.eclipse.org/downloads/packages/release/2020-09/r/eclipse-ide-enterprise-java-developers
2) Scaricare ed installare Apache Tomcat 8.5: https://tomcat.apache.org/download-80.cgi
3) Importare il progetto in Eclipse (File -> Import -> General -> Projects from Folder or Archive)
4) Avviare il server
a) (Window -> Preferences -> Server -> Runtime Environments -> Add)
b) Scegliere Apache Tomcat v8.5 e cliccare su Next
c) Cliccare su Browse per inserire la directory in cui è stato installato Apache Tomcat 8.5
d) Cliccare su Finish
e) (Window -> Show View -> Other... -> Server -> Servers -> Open)
f) Cliccare su No servers are available nel riquadro che si apre in basso
g) (Next -> Add -> Finish)
h) Fare doppio click su Tomcat v8.5 Server at localhost
i) Impostare la porta 9090 nel campo Tomcat admin port e salvare
5) Andare in WebContent, premere il tasto destro su index.jsp, spostarsi su Run As e cliccare su Run on Server
