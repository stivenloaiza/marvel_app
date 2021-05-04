import 'package:flutter/material.dart';
import 'package:marvel_ruta_n/configuration.dart' as cg;

class Button1MarvelWidget extends StatefulWidget {

  final Color colorButton;
  final String txtButton;
  final Function clickButton;

  Button1MarvelWidget({this.colorButton, this.txtButton, this.clickButton});

  @override
  _Button1MarvelWidgetState createState() => _Button1MarvelWidgetState();
}

class _Button1MarvelWidgetState extends State<Button1MarvelWidget> {
  bool hover=false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.clickButton();
      },
      onHover: (inside){
        hover=inside;
        setState(() {});
      },
      child: Container(
        width: 264,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.colorButton
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          child: Text(widget.txtButton, style: hover?cg.bodyBlancoPequeHover:cg.bodyBlancoPeque,),
        )),
      ),
    );
  }
}
