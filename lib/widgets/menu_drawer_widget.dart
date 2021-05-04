import 'package:flutter/material.dart';
import 'package:marvel_ruta_n/configuration.dart' as cg;

// ignore: must_be_immutable
class MenuDrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: cg.primaryNegro.withOpacity(0.95), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Drawer(
        elevation: 0,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              ListTile(
                title: Text(cg.menus[0], style: cg.indexMenuSelected==0?cg.menuSelected:cg.menuBlanco),
                onTap: (){
                  cg.indexMenuSelected=0;
                  Navigator.of(context).pop();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
                },
              ),
              ListTile(
                title: Text(cg.menus[1], style: cg.indexMenuSelected==1?cg.menuSelected:cg.menuBlanco),
                onTap: (){
                  cg.indexMenuSelected=1;
                  Navigator.of(context).pop();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
                },
              ),
              ListTile(
                title: Text(cg.menus[2], style: cg.indexMenuSelected==2?cg.menuSelected:cg.menuBlanco),
                onTap: (){
                  cg.indexMenuSelected=2;
                  Navigator.of(context).pop();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
                },
              ),
              ListTile(
                title: Text(cg.menus[3], style: cg.indexMenuSelected==3?cg.menuSelected:cg.menuBlanco),
                onTap: (){
                  cg.indexMenuSelected=3;
                  Navigator.of(context).pop();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
                },
              ),
              ListTile(
                title: Text(cg.menus[4], style: cg.indexMenuSelected==4?cg.menuSelected:cg.menuBlanco),
                onTap: (){
                  cg.indexMenuSelected=4;
                  Navigator.of(context).pop();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
                },
              ),
              ListTile(
                title: Text(cg.menus[5], style: cg.indexMenuSelected==5?cg.menuSelected:cg.menuBlanco),
                onTap: (){
                  cg.indexMenuSelected=5;
                  Navigator.of(context).pop();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
                },
              ),
              ListTile(
                title: Text(cg.menus[6], style: cg.indexMenuSelected==6?cg.menuSelected:cg.menuBlanco),
                onTap: (){
                  cg.indexMenuSelected=6;
                  Navigator.of(context).pop();
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoPage()));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}