import 'package:flutter/material.dart';
import 'package:marvel_ruta_n/configuration.dart' as cg;

class MenuMarvelWidget extends StatefulWidget {
  double hView;
  double wView;
  final Function clickMenuHamb;
  GlobalKey<ScaffoldState> keyScaf;

  MenuMarvelWidget({@required this.clickMenuHamb, @required this.keyScaf});

  @override
  _MenuMarvelWidgetState createState() => _MenuMarvelWidgetState();
}

class _MenuMarvelWidgetState extends State<MenuMarvelWidget> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        widget.hView=constraints.maxHeight;
        widget.wView=constraints.maxWidth;
        if(widget.wView<1024)return Container(
          height: 150,
          width: widget.wView,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(icon: Icon(Icons.menu, color: cg.neutralBlanco,),onPressed: (){widget.clickMenuHamb(widget.keyScaf);}, iconSize: 25,)
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/Avengers logo.png", ),
                ),
              ],
            ),
          ),
        );
        return Container(
          height: 150,
          width: widget.wView,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: widget.hView*0.01, horizontal: widget.wView*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/Avengers logo.png", ),
                Wrap(
                  spacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,

                  children: [
                    TextButton(
                      onPressed: (){
                        cg.indexMenuSelected=0;
                        setState(() {});
                      },
                      child: Text(cg.menus[0], textAlign:TextAlign.center,style: cg.indexMenuSelected==0?cg.menuSelected:cg.menuBlanco,),
                    ),
                    TextButton(
                      onPressed: (){
                        cg.indexMenuSelected=1;
                        setState(() {});
                      },
                      child: Text(cg.menus[1], textAlign:TextAlign.center,style: cg.indexMenuSelected==1?cg.menuSelected:cg.menuBlanco),
                    ),
                    TextButton(
                      onPressed: (){
                        cg.indexMenuSelected=2;
                        setState(() {});
                      },
                      child: Text(cg.menus[2], textAlign:TextAlign.center,style: cg.indexMenuSelected==2?cg.menuSelected:cg.menuBlanco),
                    ),
                    TextButton(
                      onPressed: (){
                        cg.indexMenuSelected=3;
                        setState(() {});
                      },
                      child: Text(cg.menus[3], textAlign:TextAlign.center,style: cg.indexMenuSelected==3?cg.menuSelected:cg.menuBlanco),
                    ),
                    TextButton(
                      onPressed: (){
                        cg.indexMenuSelected=4;
                        setState(() {});
                      },
                      child: Text(cg.menus[4], textAlign:TextAlign.center,style: cg.indexMenuSelected==4?cg.menuSelected:cg.menuBlanco),
                    ),
                    TextButton(
                      onPressed: (){
                        cg.indexMenuSelected=5;
                        setState(() {});
                      },
                      child: Text(cg.menus[5], textAlign:TextAlign.center,style: cg.indexMenuSelected==5?cg.menuSelected:cg.menuBlanco),
                    ),
                    TextButton(
                      onPressed: (){
                        cg.indexMenuSelected=6;
                        setState(() {});
                      },
                      child: Text(cg.menus[6], textAlign:TextAlign.center,style: cg.indexMenuSelected==6?cg.menuSelected:cg.menuBlanco),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}