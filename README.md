# Continuité du projet sur la méconnaissance des données naturalistes dans la région des Hauts-de-France

## Objectif

Expliquer les types de graphiques utilisés dans le rapport de l'étude afin qu'ils puissent être réutilisés et adaptés en fonction des besoins.  

## Explications de l'arborescence du projet
-   make : fichier où l'on peut exécuter l'ensemble des scripts du projet

-   data : dossier dans lequel se trouve les couches QGIS nécessaires pour la réalisation des graphiques

-   output : ce dossier réunit les sorties des graphiques

-   scripts : dossier qui regroupe tous les scripts utiles pour exécuter le projet

## Explications des scripts

- Script00_packages : inventaire de tous les packages utilisés pour l'ensemble du projet

- Script01_database : récupération des couches QGIS nécessaires et mise en forme de ces données pour pouvoir les utiliser dans les graphiques. Des calculs de pourcentages ou de surfaces sont également faits pour avoir des fichiers prêts à l'emploi pour les graphiques. 

- Script02_graphiques : exécution des différents graphiques en fonction des besoins et des fichiers préparés au préalable. Exportation de ces graphiques dans le dossier Output, selon le format voulu. 

## Résultats
Exemple de la figure 23 du rapport, exportée en jpeg directement dans le dossier des sorties.
-> graphique multifenêtres : une fenêtre par sous-trame, ordonnée = pourcentage de la surface des continuités écologiques, abscisse = départements




