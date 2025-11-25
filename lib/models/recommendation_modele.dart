import 'package:flutter/material.dart';

class RecommendationModele {

  String nom;
  String valeur;
  String image;
  Color couleur;

  RecommendationModele({
    required this.nom,
    required this.valeur,
    required this.image,
    required this.couleur,
  });

  static List<RecommendationModele> getRecommendation(){
    List<RecommendationModele> reco = [];
    
    reco.add(
     RecommendationModele(
      nom : "Voiture Ultra cher",
      valeur : '1 500 000',
      image :  "assets/icons/587548.svg",
      couleur : const Color.fromARGB(255, 73, 70, 46) 
      )
    );
    reco.add(
      RecommendationModele(
      nom : "Voiture Ancienne",
      valeur: "50 000",
      image : "assets/icons/2027713.svg" ,
      couleur : const Color.fromARGB(255, 7, 85, 33) 
      )
    );
    return reco;
  }
}