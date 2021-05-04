import 'package:flutter/material.dart';
import 'package:marvel_ruta_n/configuration.dart' as cg;
import 'package:marvel_ruta_n/widgets/buttons_widget.dart';

class PersonajeWidget extends StatelessWidget {

  final String rutaImg;
  final String titulo;
  final String descripcion;
  final Function verMasFun;

  const PersonajeWidget({@required this.rutaImg, @required  this.titulo, @required this.descripcion, @required this.verMasFun});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 600,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(rutaImg, height: 433,),
          SizedBox(height: 10,),
          Text(titulo, style: cg.subTitleBlanco, textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          Text(descripcion==""?
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
              :descripcion, style: cg.bodyAzulPeque,textAlign: TextAlign.center, maxLines: 4, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 15,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40),
            child: Button1MarvelWidget(txtButton: "Ver más",colorButton: cg.primaryMoradoclaro,clickButton: (){verMasFun();},),
          )
        ],
      ),
    );
  }
}
