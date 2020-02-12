
Créer des applications avec RShiny

Découvrir les applications Shiny




1. Créez une application permettant de faire un plot sur la table iris en fonction de variables choisies par l’utilisateur.
2. Ajoutez à votre application la possibilité pour l’utilisateur de ne filtrer que certaines observations en fonction de la longueur et la largeur des pétale et des sépales.
3. Faites maintenant en sorte que le graphique ne se mette pas à jour dès que l’utilisateur change des paramètres mais seulement après qu’il clique sur un bouton (voir actionButton() pour la partie ui et eventreactive() pour la partie server).
4. Créez une application avec 3 onglets : dans le premier, le plot réalisé jusqu’à maintenant, dans le second, la table iris affichée grâce à dataTableOutput avec la possibilité pour l’utilisateur de trier selon la valeur de Species, dans le troisième un texte qui donne le résultat de la moyenne d’une variable choisie par l’utilisateur (exemple : “la moyenne de la variable Sepal.Length est de 5.4”)

