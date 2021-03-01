# Oppgave 2

Her skulle vi lage terraform file som skulle holde på 
terraform kode. Denne terraform koden skulle hjelpe til
med å lage en `Google Cloud Storage Bucket` som senere skal brukes i neste
oppgave for å lagre for Terrform/Travis.

## For å lage en service account nøkkel

Dette kan gjøres i gui og gjennom terminalen og nedenfor finner du begge
fremgangsmåtene.


### For å lage et Google Cloud Project:

- Skriv inn kommandoen `gcloud init` i terminalen for å
velge eller lage et nytt prosjekt. Deretter følger stegene for å lage prosjektet.
  

### Lage en service account

Når prosjektet er laget så kan man bruke google cloud platform sitt interface
for å lage en service account.

- Først gå til `IAM & admin` så klikke på `Service Accounts` og trykk på 

`Create service account`. 

- Her skal du gi ett navn og trykke på `Create` når du skal lage den.

- Når du blir spurt om å gi en rolle så skal det velges `Storafe admin`.

- Da er du ferdig og trykker på `Done`.

### Lage nøkkelen

For å lage nøkkelen `google-key.json` gjennom bruker grensesnittet til google plattform så må det gjøres
følgende.

- Trykk på `service accounten` som du nylig har laget.

- Trykk på nøkkel altså `keys` 

- Trykk deretter på `Add key` og så tislutt for lage nøkkelen trykk på `Create new key`

- Avslutt med å trykke på `Create`


Dette vil laste ned en json fil som du skal senere kryptere.


- Deretter koper denne filen inn til prosjektet, og den skal ligge i roten av prosjektet


### Få tak i nåværende GCP prosjekt id:

Får å få tak i prosjekt id skrive følgende kommando i terminalen.

`PROJECT_ID="$(gcloud config get-value project -q)"`

### Lage Service account:

For å lage en service account så må følgende steg i terminalen gjennomføres.

`SVCACCT_NAME= <navnet du ønsker å sette>`

Etter på skriver du dette i terminalen

`gcloud iam service-accounts create "${SVCACCT_NAME?}"`

### For å gi rettigheter som Storage admin:

Denne kommandoen gir service account rettigheten til å være storage admin.

`gcloud projects add-iam-policy-binding "${PROJECT_ID?}" \
--member="serviceAccount:${SVCACCT_EMAIL?}" \
--role="roles/storage.admin"`

### Lage nøkkelen

For lage nøkkelen så kan du skrive følgende kommando i terminalen

`gcloud iam service-accounts keys create "google-key.json" \
--iam-account="${SVCACCT_EMAIL?}"`

Du vil da se en nøkkel i terminalen og en fil som blir laget under 
directory som heter `google-key.json`

### Kryptere nøkkelen 

Denne kommandoen kjører du i terminalen for å kryptere nøkkelen du fikk fra 
å kjøre kommandoen over.

`travis encrypt-file google-key.json --add`

## Sette opp variable for terraform

For at oppgaven skal bli besvart så ønskes det en fremgangsmåte som en sensor 
skal følge for å sette opp disse variablene.

Dette er ulikt fra operativsystemr så jeg legger inn begge måtene under.

### Dette skal gjøres for Windows

- For gi `Bucket name`:

`set bucket-name=YOUR_BUCKET_NAME`


- For å gi `Project ID`:

`set project-id=YOUR_PROJECT_ID`


- Legg til dine `enc` variabler:

`set TF_VAR_project_id=%project-id%`


Så setter du dette:

`set TF_VAR_bucket=%bucket-name%`


### Dette skal gjøres for mac

- For gi `Bucket name`:

`export bucket-name=YOUR_BUCKET_NAME`


- For å gi `Project ID`:

`export project-id=YOUR_PROJECT_ID`


- Legg til dine `enc` variabler:

`export TF_VAR_project_id=$project-id`


Så setter du dette:

`export TF_VAR_bucket=$bucket-name`


### For å kjøre Terraform

For å kjøre terraform så trenger du følgende kommandoer:

- `terraform init`
- `terraform apply`

Dette vil resultere til at en bucket i google cloud blir opprettet.


# Oppgave 3



