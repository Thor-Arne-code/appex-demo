# Demo for appex

>Her er oppgaven:
> - Lag et enkelt CRUD-skjermbilde hvorav noe av data som lagres er hentet fra et eksternt API.
> - Skjermbildet må kunne filtreres på relevante felter, og skal fungere like fint med 10 rader som med 100 000.
> - Data som lagres skal være på minst to nivå (parent-child), f.eks ordre->ordrelinjer, firma->ansatte, person->adresser eller tilsvarende.
> - Teknologi velger du selv, men sett opp en readme-fil som viser hvordan løsningen startes (eller legg den ut på en hostingtjeneste et sted).
> - Gi oss tilgang til et Git-repository med koden (eller la det ligge public).

----

## Platform
Jeg har valgt database MySQL 8 og RAD Studio 11 (Object Pascal) da dette er verktøy jeg allerede har lisens på og som tillater rask utvikling.

Det benyttes et direktekobling bibliotek mot databasen (DAC) som betyr at hele applikasjonen blir en enkelt eksekverbar som ikke er avhengig av noen eksterne filer for å kjøre.

### Database
Datamodell er laget i MySQL Workbench, denne ligger tilgjengelig i [katalogen](./database/). 

Det er ingen praktisk begrensing i antall rader i databasen (maks er 2^48 eller 281 474 976 710 656 rader).

### Rest API
For å hente poststed ut fra postnummer benyttes ```https://webapi.no/api/v1/zipcode/####``` som ved endring lagres sammen med data i databasen.

## Forutsetninger
For å starte applikasonen må MySQL kjøre på maskinen, og ha relevant skjema importert og bruker opprettet. [SQL skript](.database/appex-demo.sql) for å importere database oppsett.

Bruker må hete ```Demo``` og ha passord ```appex```, og ha alle rettigheter til ```appexdemo``` skjema.

### Starte applikasjonen
Den kjørbare applikasjonen, [Windows 32-bit](./Win32/Release), er inkludert i GitHub repo.

## Begrensinger
Det er utelatt konfigurering og feilhåndtering, det er for tidkrevende å håndtere alle mulige brukerfeil innen fristen.

Alle feil vil bli behandlet av standard rutiner i RAD Studio.
