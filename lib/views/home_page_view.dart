import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_ruta_n/configuration.dart' as cg;
import 'package:marvel_ruta_n/services/marvel_services.dart';
import 'package:marvel_ruta_n/widgets/buttons_widget.dart';
import 'package:marvel_ruta_n/widgets/footer_widget.dart';
import 'package:marvel_ruta_n/widgets/menu_drawer_widget.dart';
import 'package:marvel_ruta_n/widgets/menu_marvel_widget.dart';
import 'package:marvel_ruta_n/widgets/personaje_widget.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  double hView, wView;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> listDatosPersonajes=[];
  bool cargando=true;
  ScrollController horizontalController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    loadDataPersonajes();
    super.initState();
  }

  void loadDataPersonajes()async{
    cargando=true;
    for(int i =0; i<cg.listPersonajes.length;i++){
      Map<String, dynamic> tempResult = await MarvelServices.getPersonaje(cg.listPersonajes[i]);
      if(tempResult!=null){
        listDatosPersonajes.add(tempResult['data']);
      }
    }
    cargando=false;
    if(this.mounted){
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    wView= MediaQuery.of(context).size.width;
    hView= MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      drawer: MenuDrawerWidget(),
      body: Stack(
        children: [
          PageView(
            children: [
              ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 280),
                    height: wView<1024?1400:800,
                    clipBehavior: Clip.none,
                    width: wView,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/space-galaxy-bg.jpg"),
                        fit: BoxFit.fill
                      )
                    ),
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: wView<1024? 10:0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Avengers\nCrew", style: cg.titleBlanco,),
                                  Text("Descubre la vida secreta de los heroes con los que cresciste", style: cg.bodyBlancoPeque,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 20),
                                    child: Button1MarvelWidget(colorButton: cg.primaryRojo, txtButton: "Conoce los personajes", clickButton: (){},),
                                  ),
                                  SizedBox(height: 250,)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            width: 600,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(top: -(hView*0.15), left: 150,child: Image.asset("assets/images/Hulk.png", height: 436,), ),
                                Positioned( left: 100,child: Image.asset("assets/images/thor.png", height: 436,)),
                                Positioned( left: 230,child: Image.asset("assets/images/Black Widow.png", height: 436,)),
                                Positioned(top: -(hView*0.07), left: 320,child: Image.asset("assets/images/Ironman.png", height: 436,)),
                                Positioned(bottom: -20, left: 320,child: Image.asset("assets/images/Black Panter.png", height: 390,)),
                                Align(alignment: Alignment.bottomLeft,child: Image.asset("assets/images/Roggers.png", height: 410,)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1600,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, cg.primaryNegro, cg.primaryMoradoOscuro],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      )
                    ),
                    child: cargando?Container(height: 100, width: 100, child: CircularProgressIndicator(),):
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text("Los personajes", textAlign: TextAlign.center, style: cg.titlePequeBlanco,),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: horizontalController,
                                itemCount: listDatosPersonajes.length,
                                  itemBuilder: (context, indexBuild){
                                    return PersonajeWidget(rutaImg: cg.listPersonajesFotos[indexBuild], titulo: listDatosPersonajes[indexBuild]['results'][0]['name'], descripcion: listDatosPersonajes[indexBuild]['results'][0]['description'], verMasFun: (){});
                                  }
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 50),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: (){
                                      horizontalController.jumpTo(horizontalController.offset-300);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cg.primaryRojo,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.arrow_back_ios, color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: 50),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: (){
                                      horizontalController.jumpTo(horizontalController.offset+300);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cg.primaryRojo,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 200,),
                        Container(
                          height: 400,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: wView*0.12),
                                child: Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 20,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    gradient: LinearGradient(
                                      colors: [cg.secundaryAzul, cg.primaryMoradoOscuro],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter
                                    ),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox(),),
                                      Container(
                                        width: 471,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Falcon y el soldado de invierno", textAlign: TextAlign.left, style: cg.titlePequeBlanco,),
                                            Text("Una serie exclusiva de Disney", textAlign: TextAlign.left, style: cg.bodyAzulClaro,),
                                            SizedBox(height: 10,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(width: 165,child: Button1MarvelWidget(colorButton: cg.primaryMoradoclaro, txtButton: "Ver ahora",)),
                                                Image.asset("assets/images/Disney_Channel_wordmark.png", height: 51,),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -130,
                                left: 150,
                                child: Container(
                                  clipBehavior: Clip.none,
                                  width: 300,
                                  child: Image.asset("assets/images/falcon-winter-soldier.png", height: 455,),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  FooterWidget(hView: hView, wView: wView)
                ],
              )
            ],
          ),
          SafeArea(
              child: MenuMarvelWidget(clickMenuHamb: clickMenuHamb,  keyScaf: scaffoldKey,)
          )
        ],
      ),
    );
  }

  void clickMenuHamb(GlobalKey<ScaffoldState> llave){
    llave.currentState.openDrawer();
  }

}
