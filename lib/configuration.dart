import 'dart:ui';

import 'package:flutter/material.dart';

//variables globales
final String pubKMarvelAPI="5bfdaaccb35e714e956317cab76cd42d";
final String priKMarvelAPI="db768e1afd5c1b9f5f3e48ad950e07cba7c5edeb";
final String hashMarvelAPI="ac5735a846871348f3b3390cec0fada5";
final String tsMarvelAPI="1";
final String urlApiMarvel="https://gateway.marvel.com:443/v1";

final String nombreApp="MarvelAPP";
final List<String> menus = ["Inicio", "Iron Man", "Viuda negra", "Capitán America", "Pantera negra", "Hulk", "Thor"];
final List<String> listPersonajes = ["Iron Man", "Black Widow", "Captain America", "Black Panther", "Hulk", "Thor"];
final List<String> listPersonajesFotos = ["assets/images/Ironman.png", "assets/images/Black Widow.png", "assets/images/Roggers.png", "assets/images/Black Panter.png", "assets/images/Hulk.png", "assets/images/thor.png"];

int indexMenuSelected=0;

//Colors
final Color primaryMoradoOscuro = Color(0XFF5432D3);
final Color primaryMoradoclaro = Color(0XFFB224EF);
final Color primaryRojo = Color(0XFFF2264B);
final Color primaryNegro = Color(0XFF313140);
final Color secundaryAzul = Color(0XFF005BEA);
final Color secundaryAzulClaro = Color(0XFF00C6FB);
final Color neutralBlanco = Color(0XFFF5F5F5);
final Color neutralAzulclaro = Color(0XFFC5E3F6);

//TextStyles
TextStyle titleBlanco = TextStyle(color: Colors.white, fontSize: 72, fontWeight: FontWeight.bold);
TextStyle titlePequeBlanco = TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold);
TextStyle subTitleBlanco = TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
TextStyle bodyBlanco = TextStyle(color: neutralBlanco, fontSize: 18,);
TextStyle bodyAzulClaro = TextStyle(color: neutralAzulclaro, fontSize: 18,);
TextStyle bodyBlancoPeque = TextStyle(color: Colors.white, fontSize: 15,);
TextStyle bodyAzulPeque = TextStyle(color: neutralAzulclaro, fontSize: 15,);
TextStyle bodyBlancoPequeHover = TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15,);
TextStyle menuBlanco = TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold);
TextStyle menuSelected = TextStyle(color: primaryMoradoOscuro, fontSize: 16, fontWeight: FontWeight.bold);