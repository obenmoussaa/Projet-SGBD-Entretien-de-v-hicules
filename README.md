Ce projet consiste à réaliser une base de données pour gérer l’entretien de véhicules au sein
d’un garage. On dispose des informations suivantes.
— Chaque client est enregistré avec son adresse, son mail et son numéro de téléphone.
— Pour chaque véhicule, on possède l’essentiel des informations contenues sur la carte grise
(immatriculation, date de mise en circulation, propriétaire, type de véhicule). Le garage
possède aussi des caractéristiques plus précises sur le véhicule (motorisation précise par
exemple) qui lui permettent le cas échéant de commander les pièces détachées adéquates
pour le véhicule.
— On désire garder un historique complet de toutes les prises en charge par le garage : date de
prise en charge et de retour au client, kilométrage, actions réalisées (main d’œuvre, pièces),
devis annoncé, facture, etc. Évidemment, on désire pouvoir programmer des interventions
en précisant la nature de l’intervention prévue (il est possible qu’un imprévu surgisse lors
de la prise en charge) et sa durée prévisionnelle. On veut pouvoir aussi enregistrer si besoin
les interventions subies par le véhicule au sein d’un autre garage.
— On souhaite aussi que le garage puisse rappeler au client l’opportunité d’une intervention.
Il peut s’agir d’un entretien courant (vidange à effectuer un certain temps ou kilométrage
après la dernière en date, intervention programmée dès la mise en service – comme la
courroie de distribution) ou d’une invertion prescrite suite à une visite (“la prochaine fois, il
faudra changer les plaquettes de frein”). Pour chacune de ces prescriptions, on veut pouvoir
enregistrer si elles ont été effectuées, soit par une intervention du garage, soit éventuellement
par un autre garage.
— On veut avoir un référentiel de chaque type d’intervention possible, à la fois pour avoir des
intitulés unifiés, mais aussi pour maintenir une grille tarifaire. Noter que la tarification de
certaines interventions peut dépendre du type de véhicule.
On veut stocker toutes ces informations dans la base, et pouvoir disposer des requêtes de service
suivantes (liste non exhaustive):
- Consultation
- mise à jour
- statistiques
