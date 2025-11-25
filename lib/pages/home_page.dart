import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trying_flutter/models/categorie_modele.dart';
import 'package:trying_flutter/models/recommendation_modele.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModele> categorie = [];
  List<RecommendationModele> reco = [];

  void _initInfo(){
    categorie =CategorieModele.getCategorie();
    reco=RecommendationModele.getRecommendation();
  }

  @override
  Widget build(BuildContext context) {
    _initInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textfield(),
          SizedBox(height: 40),
          _categorie(),
          SizedBox(height: 40),
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
        ]
      )
    );
  }

  Column _categorie() {
    return Column(
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
  }
                  


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

  AppBar appBar() {
    return AppBar(
      title: const Text('Home Page',
      style: TextStyle(
        color: Colors.black
      )
      ) ,
      backgroundColor: Colors.amber,
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
      );
  }
}