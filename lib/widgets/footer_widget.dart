import 'package:flutter/material.dart';
import 'package:marvel_ruta_n/configuration.dart' as cg;

class FooterWidget extends StatelessWidget {
  final double hView;
  final double wView;

  const FooterWidget({@required this.hView, @required this.wView});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cg.primaryNegro,
      height: 100,
      width: wView,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/marvel-logo.png", height: 30, ),
          SizedBox(height: 4,),
          Text("©Disney Company  todos los derechos reservados", style:cg.bodyBlanco)
        ],
      ),
    );
  }
}
