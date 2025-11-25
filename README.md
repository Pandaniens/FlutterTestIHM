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

Ce tp a pour but de vous présenter Flutter et son utilisation dans le cadre d'une application mobile.
Attendez la fin de l'exercice 1 avant de lancer la commande prochaine.
Pour lancer flutter, lancer la commande Flutter run.
Si vous voulez utiliser un emulateur android ou autre, lancer l'emulateur puis flutter run.

'''
flutter run
'''

## Exo1:

La premiere étape de cette exercice est de créer une page main.dart dans le dossier lib, c'est dans ce dossier qu'une grande partie se fera
Après avoir créer cette page, vous allez ajouter le code suivant dans le fichier

'''
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
'''
Voici le début du projet avec la création de votre premier Widget.

## Exo2:

Une fois que vous avez lancé flutter, une page est apparu et celle-ci est vide.
Vous aller créer un dossier pages, contenant toutes vos pages.
Une fois ce dossier créer, ajouter un nouveau fichier dart.
/!\ Dart utilise une notation spéciale, éviter les majuscules et préferer des _ pour séparer des mots.

Une fois votre page créer, ajouter le code suivant /!\ Penser à changer le nom de la classe pour correspondre à celle dans le main.

'''
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
'''

Vous pouvez aussi le créer rapidement en écrivant stl, et en cliquant sur Flutter StatefulWidget.
Créer maintenant une nouvelle classe _HomePageState qui étends notre HomePage

'''
class _HomePageState extends State<HomePage> {
    Widget build(BuildContext context) {
        return Scaffold() //Regarder la documentation pour voir comment ce widget apparait sur l'écran.
    }
}
'''
C'est dans ce widget que vous allez créer l'application.
Vous aller commencer par créer un AppBar dans le Scaffold

'''
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
'''

Bien maintenant une barre en haut de la page est apparu.

## Exo3:

A partir de maintenant, essayer de faire le TP en vous aidant de la documentation et si vous n'y arriver vraiment pas, nous vous donner le code

Ajoutons des boutons sur cette barre.
Pour cela vous aller avoir besoin d'utiliser des attributs de appBar telle que leading, et actions.
Quand au bouton, vous pouvez utiliser le Widget IconButton.

'''
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
'''

Maintenant que votre appBar à été créer, vous pouvez l'extraire dans une fonction pour alléger le code contenu dans le build.
Pour cela, aller sur la ligne appBar, faite (ctrl + ;) et cliquer sur l'icone Extraire méthode.

## Exo 4:

Ajoutez une barre de recherche en dessous de votre appBar.
Pour cela utiliser l'attribut body de Scaffold et le Widget TextField.

'''
body: TextField()
'''
Un champ de texte est apparu, mais celui-ci ne correpond pas a nos attente, il est trop grand.

Vous allez le modifier en wrappant le TextField avec un Container (CTRL + ;), en mettant le TextField dans l'attribut child:
Et modifier le margin: du Container      /!\ utilisez le EdgeInsets.only(), pour modifier le margin.

'''
Container(
    margin: EdgeInsets.only(top: 40, left: 20,right: 20),
    child: TextField()
)
'''
Ajouter une decoration dans votre TextField afin d'ajouter une icone de loupe au début, un texte par défaut, une barre servant de séparateur pour afficher l'icone de filtre.
Pour cela vous allez utilisé, une InputDecoration, en modifiant les paramètres hintText: ,  contentPadding: , prefixIcon:, suffixIcon:

'''
decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Rechercher un objet",
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Incons.filter_alt)
)
Mais comment faire pour ajouter la barre séparatrice?
Il suffit de modifier suffixIcon: creer un SizedBox, et ajouter un IntrinsicHeight  //Cela permettra une taille constante entre l'icon et le séparateur
Pour que les objets soit alignés utilisé un Widget appelé Row et en modifiant le mainAxisAlignement:
Et surtout pour faire ce séparateur, un Widget appelé VerticalDivider existe.

'''
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
'''

Très bien, ajoutez maintenant un ombrage à notre Container contenant le TextField
Modifier decoration: avec une BoxDecoration, lui même en ajoutant un BoxShadow.

'''
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
'''

Vous pouvez maintenant extraire le container dans une méthode, pour épurer votre build.
Vous devez obtenir cette méthode.

'''
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
'''

## Exo5:

Maintenant, vous allez créer une liste de view permettant de voir plusieurs objets Catégorie dont le modèle est donnée dans libs/models.
Pour cela regarder le widget LastView.separeted() et modifier l'attribut itemCount et un itemBuilder et dans cet attribut créer des Containers.
N'oublier pas de créer les catégorie en appelant le modèle.
Bonne chance

'''
 void _initInfo(){
    categorie =CategorieModele.getCategorie();
  }
'''

'''
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
'''

Pour que vous aidez, voici le code complet pour afficher les listes

'''
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
'''

Extrayez le code

## Exo6

Maintenant vous allez faire de meme avec le modèle de recommandation
'''
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
'''

Mais lors de 