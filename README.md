
Créer des applications avec RShiny

Découvrir les applications Shiny

    Baladez-vous sur la galerie RShiny de RStudio et testez différentes applications.
    Depuis RStudio, créez votre première application RShiny à partir du template proposé (New file –> Shiny Web App). Identifiez les différents éléments du code. Faites tourner l’application et testez-là.

On repart d’un code vierge avec seulement les éléments server et ui sans code à l’intérieur.
Éléments de l’interface UI

    Dans le code ui.R, testez les différentes fonctions permettant d’organiser l’aspect général de votre application :

    fluidRow() : Créez 3 panels de tailles différentes que vous nommerez “panel 1”, “panel 2” et “panel 3”.
    flowLayout() : Créez 4 panels de même taille.
    sidebarLayout() : Créez un panel sur le côté nommé “side_panel” et un panel central nommé “main_panel”.
    Cherchez d’autres possibilités d’organisation des panels…

    Créez de nouveau une application vide avec seulement des noms de panel mais avec différents onglets : vous pouvez utiliser navbarPage() ou tabsetPanel() par exemple.

Une application Shiny permet à l’utilisateur d’interagir avec les résultats en changeant par exemple des paramètres qu’on lui propose. Cela se fait par l’intermédiaire de widgets. Vous pouvez parcourir les widgets disponibles ici.

    Créez une application simple avec sidebarLayout(). Dans le sidebarPanel(), proposez des widgets que vous aurez inventé à l’utilisateur de l’application en utilisant la plus grande diversité de widgets possibles.
    Il faut maintenant faire appel à ces variables renseignées par l’utilisateur dans notre code server. Comment faire appel à celles-ci?

Dans le programme ui, on pourra ensuite afficher les résultats calculés dans server avec les fonctions dataTableOutput(), imageOutput(), plotOutput()… selon la nature de l’output désiré.
Le programme server

Le programme server est celui qui permet de faire le lien entre ce que l’utilisateur de l’application renseigne et les résultats qui s’affichent dans l’application. Il prend en entrée les éléments de la liste input alimentés par l’utilisateur et ressort des éléments dans une liste output qui seront à leur tour appelés dans le programme ui.R pour être affichés.
1. Lisez et faites le cas pratique de la leçon 4 du tutoriel RStudio.
2. Créez une application permettant de faire un plot sur la table iris en fonction de variables choisies par l’utilisateur.
3. Ajoutez à votre application la possibilité pour l’utilisateur de ne filtrer que certaines observations en fonction de la longueur et la largeur des pétale et des sépales.
4. Faites maintenant en sorte que le graphique ne se mette pas à jour dès que l’utilisateur change des paramètres mais seulement après qu’il clique sur un bouton (voir actionButton() pour la partie ui et eventreactive() pour la partie server).
5. Créez une application avec 3 onglets : dans le premier, le plot réalisé jusqu’à maintenant, dans le second, la table iris affichée grâce à dataTableOutput avec la possibilité pour l’utilisateur de trier selon la valeur de Species, dans le troisième un texte qui donne le résultat de la moyenne d’une variable choisie par l’utilisateur (exemple : “la moyenne de la variable Sepal.Length est de 5.4”)

