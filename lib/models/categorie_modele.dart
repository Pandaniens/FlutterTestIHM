import 'package:flutter/material.dart';

class CategorieModele {

  String nom;
  Icon image;
  Color couleur;

  CategorieModele({
    required this.nom,
    required this.image,
    required this.couleur,
  });

  static List<CategorieModele> getCategorie(){
    List<CategorieModele> categorie = [];
    
    categorie.add(
      CategorieModele(
      nom : "Voiture",
      image : Icon(Icons.car_rental) ,
      couleur : Colors.yellow 
      )
    );
    categorie.add(
      CategorieModele(
      nom : "Nourriture",
      image : Icon(Icons.food_bank) ,
      couleur : Colors.orange 
      )
    );
    categorie.add(
      CategorieModele(
      nom : "Maison",
      image : Icon(Icons.home) ,
      couleur : Colors.green 
      )
    );
    return categorie;
  }
}