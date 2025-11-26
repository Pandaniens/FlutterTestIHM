# trying_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# ExerciceTP

Ce TP a pour objectif de vous présenter Flutter et son utilisation dans le développement d’applications mobiles.
Veuillez attendre la fin de l’exercice 1 avant d’exécuter la commande suivante.
Si vous souhaitez utiliser un émulateur Android ou un autre dispositif virtuel, démarrez d’abord l’émulateur, puis lancez la commande :

```
flutter run
```

## Exo1:

La première étape de cet exercice consiste à créer un fichier main.dart dans le dossier lib. C’est dans ce dossier que vous réaliserez la majorité du travail.

Une fois ce fichier créé, ajoutez-y le code suivant :

```
import 'package:flutter/material.dart';
import 'package:trying_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //Enleve une bannière debug
        title:'Exemple Flutter', //Nom du site
        home: HomePage() // Page Principale, vous pouvez la nommer à votre guise
      );
  }
}
```
Voici le début du projet avec la création de votre premier Widget.

## Exo2:

Une fois que vous avez lancé Flutter, une page apparaît : elle est pour l’instant vide.

Vous allez maintenant créer un dossier pages, qui contiendra l’ensemble de vos différentes pages.
Après avoir créé ce dossier, ajoutez-y un nouveau fichier Dart.

⚠️ Attention : Dart utilise une convention de nommage particulière.
Évitez les majuscules dans les noms de fichiers et utilisez plutôt les underscores (_) pour séparer les mots.

Une fois votre page créée, ajoutez le code suivant dans votre fichier.

⚠️ N’oubliez pas de modifier le nom de la classe afin qu’il corresponde à celui utilisé dans main.dart.
```
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
```

Vous pouvez également créer cette structure plus rapidement en tapant stl puis en sélectionnant Flutter StatefulWidget dans les suggestions.

Créez ensuite une nouvelle classe _HomePageState, qui étendra votre classe HomePage.

```
class _HomePageState extends State<HomePage> {
    Widget build(BuildContext context) {
        return Scaffold() //Regarder la documentation pour voir comment ce widget apparait sur l'écran.
    }
}
```
C’est à l’intérieur de ce widget que vous allez construire votre application.

Commencez par ajouter une AppBar dans votre Scaffold.

```
return Scaffold(
    appBar: AppBar(
      title: const Text('Home Page',
        style: TextStyle(
            color: Colors.black
            )
        ),
      backgroundColor: Colors.amber,
      )
)
```

Bien maintenant une barre en haut de la page est apparu.

## Exo3:

À partir de maintenant, essayez de réaliser le TP en vous aidant de la documentation.
Si vous n’y parvenez vraiment pas, nous vous fournirons le code.

Ajoutons maintenant des boutons sur la barre d’application.
Pour cela, vous aurez besoin d’utiliser certains attributs de l’AppBar, comme leading et actions.

Pour créer les boutons, vous pouvez utiliser le widget IconButton.
```
leading:  IconButton(
        icon: const Icon(Icons.home),
        onPressed: () {
          // Action when settings icon is pressed
        },
        ),
actions: [
    IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
            // Action when settings icon is pressed
        },
    ),
],
```

Maintenant que votre AppBar a été créée, vous pouvez l’extraire dans une fonction afin d’alléger le code présent dans la méthode build.

Pour cela, placez votre curseur sur la ligne contenant appBar, puis utilisez Ctrl + ; et sélectionnez l’option “Extraire méthode”.

## Exo 4:

Ajoutez maintenant une barre de recherche sous votre AppBar.
Pour cela, utilisez l’attribut body du Scaffold, ainsi que le widget TextField.

```
body: TextField()
```
Un champ de texte est apparu, mais il ne correspond pas encore à nos attentes : il est trop grand.

Pour le modifier, encapsulez le TextField dans un Container (via Ctrl + ;, puis « Wrap with Container »).
Placez ensuite le TextField dans l’attribut child du Container.

Enfin, ajustez l’apparence du champ en modifiant la propriété margin du Container.

⚠️ Utilisez EdgeInsets.only() pour définir précisément les marges.

```
Container(
    margin: EdgeInsets.only(top: 40, left: 20,right: 20),
    child: TextField()
)
```
Ajoutez maintenant une décoration à votre TextField afin de :

afficher une icône de loupe au début,

ajouter un texte par défaut (placeholder),

inclure une barre séparatrice pour l’icône de filtre à la fin.

Pour ce faire, utilisez un InputDecoration et modifiez les paramètres suivants :

hintText: pour le texte par défaut,

contentPadding: pour ajuster les espacements internes,

prefixIcon: pour l’icône au début,

suffixIcon: pour l’icône à la fin.

```
decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Rechercher un objet",
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.filter_alt)
)
```
Pour ajouter la barre séparatrice dans votre TextField :

Dans suffixIcon:, créez un SizedBox.

À l’intérieur, utilisez un IntrinsicHeight pour garantir une taille constante entre l’icône et le séparateur.

Pour aligner correctement les éléments, placez-les dans un Row et ajustez la propriété mainAxisAlignment.

Enfin, pour créer le séparateur vertical, utilisez le widget VerticalDivider.

Ainsi, vous aurez une barre de séparation propre entre votre icône et le reste du contenu.
```
 suffixIcon: SizedBox(
                width: 95,
                child: IntrinsicHeight(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    VerticalDivider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 0.3,
                    ),
                    Padding(
                    padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.filter_alt),
                    ) 
                  ]
                ),
                ),
              )
```

Ajoutez maintenant un ombrage au Container contenant votre TextField.

Pour cela :

Modifiez la propriété decoration: du Container en utilisant un BoxDecoration.

À l’intérieur de ce BoxDecoration, ajoutez un BoxShadow pour créer l’effet d’ombre.

```
decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset.zero,
                blurRadius: 10,
                spreadRadius: 0.10,
              )
            ]
          ),
```

Vous pouvez maintenant extraire le Container contenant le TextField dans une méthode séparée afin d’alléger le code de votre build.

À l’issue de cette opération, vous devriez obtenir une méthode similaire à celle-ci :

```
Container _textfield() {
    return Container(
          margin: EdgeInsets.only(top: 40, left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset.zero,
                blurRadius: 10,
                spreadRadius: 0.10,
              )
            ]
          ),
          child: TextField(
            decoration:  InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Rechercher un objet",
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(Icons.search),
              suffixIcon: SizedBox(
                width: 95,
                child: IntrinsicHeight(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    VerticalDivider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 0.3,
                    ),
                    Padding(
                    padding: EdgeInsets.all(8.0),
                     child: Icon(Icons.filter_alt),
                    ) 
                  ]
                ),
                ),
              ) 
                , 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        );
  }
```

## Exo5:

Maintenant, vous allez créer une liste de vues permettant d’afficher plusieurs objets Catégorie, dont le modèle est fourni dans lib/models.

Pour cela :

Utilisez le widget ListView.separated().

Modifiez les attributs :

itemCount pour définir le nombre d’éléments,

itemBuilder pour créer le contenu de chaque élément.

Dans l’itemBuilder, créez des Container pour chaque catégorie et n’oubliez pas de créer les instances de vos catégories en utilisant le modèle fourni.

Bonne chance !

```
 void _initInfo(){
    categorie =CategorieModele.getCategorie();
  }
```

```
ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width:25,),
                scrollDirection: Axis.horizontal,//permet de rendre la direction des objets en horizontal et non en vertical de base
                itemCount: categorie.length,
                itemBuilder: (context,index){
                   return Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: categorie[index].couleur.withValues(alpha:0.3),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: categorie[index].image,
                        ),
                      ),
                      Text(
                        categorie[index].nom,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14
                        ),
                      )
                    ],
                  ),
                );
              },
            )
```

Pour vous aidez, voici le code complet pour afficher les listes

```
Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
              padding: EdgeInsets.only(left:150), 
              child:Text("Catégorie",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                   fontWeight: FontWeight.w600
               ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width:25,),
                scrollDirection: Axis.horizontal,
                itemCount: categorie.length,
                itemBuilder: (context,index){
                   return Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: categorie[index].couleur.withValues(alpha:0.3),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: categorie[index].image,
                        ),
                      ),
                      Text(
                        categorie[index].nom,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
        );
```

Vous pouvez maintenant extraire le code de la liste dans une fonction afin d’alléger la méthode build.

Pour cela :

Placez votre curseur sur le bloc de code à extraire.

Appuyez sur Ctrl + ; et sélectionnez “Extraire méthode”.

## Exo6

Maintenant, vous allez procéder de la même manière pour le modèle de recommandations.

```
Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
              padding: EdgeInsets.only(left:150), 
              child:Text("Recommandation Voiture",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                   fontWeight: FontWeight.w600
               ),
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width:25,),
                scrollDirection: Axis.horizontal,
                itemCount: reco.length,
                itemBuilder: (context,index){
                  return Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: reco[index].couleur.withValues(alpha:0.3),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 140,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(reco[index].image),
                        ),
                      ),
                      Text(
                        reco[index].nom,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        reco[index].valeur,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
        )
```

Lors du rafraîchissement de la page, une erreur peut survenir si Flutter ne reconnaît pas SvgPicture.

Pour résoudre ce problème :

Installez le package flutter_svg pour pouvoir utiliser les images au format SVG.

Ajoutez le chemin de vos images dans le fichier pubspec.yaml :

Modifiez la section dependencies: pour ajouter flutter_svg.

Modifiez la section assets: pour inclure le dossier contenant vos images.

Normalement, Flutter prendra automatiquement en compte ces modifications et vous pourrez utiliser SvgPicture sans erreur.

```
flutter pub get
```

🎉 Félicitations !
Une fois toutes ces étapes terminées, vous avez créé votre première page en Flutter !

## Exo Bonus

Maintenant que vous avez créé votre première page, créez une deuxième page, par exemple une page Settings, à votre guise.

Pour naviguer entre les pages, utilisez le widget Navigator :

Navigator.push pour aller vers une nouvelle page,

Navigator.pop pour revenir à la page précédente.

Ainsi, vous pourrez passer facilement de votre première page à la page de paramètres et vice-versa.