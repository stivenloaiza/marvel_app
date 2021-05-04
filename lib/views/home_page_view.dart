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
  PageController controllerPage = PageController(initialPage: 0,);
  int idSubMenu = 0;

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
  void dispose() {
    controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    wView= MediaQuery.of(context).size.width;
    hView= MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      drawer: MenuDrawerWidget(personajeSelected: personajeSelected,),
      body: Stack(
        children: [
          PageView(
            controller: controllerPage,
            children: [
              //home page
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
                                    return PersonajeWidget(rutaImg: cg.listPersonajesFotos[indexBuild], titulo: listDatosPersonajes[indexBuild]['results'][0]['name'], descripcion: listDatosPersonajes[indexBuild]['results'][0]['description'], verMasFun: (){
                                      cg.indexMenuSelected=indexBuild+1;
                                      personajeSelected();
                                    });
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
                        if(wView<1024)Container(
                          clipBehavior: Clip.none,
                          width: 300,
                          child: Image.asset("assets/images/falcon-winter-soldier.png", height: 200,),
                        ),
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
                                        width: wView<1024?350:471,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Falcon y el soldado de invierno", textAlign: TextAlign.left, style: cg.titlePequeBlanco2,),
                                            Text("Una serie exclusiva de Disney", textAlign: TextAlign.left, style: cg.bodyAzulClaro,),
                                            SizedBox(height: 10,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                wView<1024?Container(width: 80,child: Button1MarvelWidget(colorButton: cg.primaryMoradoclaro, txtButton: "Ver",)) :Container(width: 165,child: Button1MarvelWidget(colorButton: cg.primaryMoradoclaro, txtButton: "Ver ahora",)),
                                                wView<1024?Image.asset("assets/images/Disney_Channel_wordmark.png", height: 25,):Image.asset("assets/images/Disney_Channel_wordmark.png", height: 51,),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              if(wView>=1024)Positioned(
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
              ),
              //segunda page
              ListView(
                children: [
                  cg.indexMenuSelected==0?Container():Container(
                    padding: EdgeInsets.only(top: 280),
                    height: wView<1024?1400:800,
                    clipBehavior: Clip.none,
                    width: wView,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/solar-system-bg.jpg"),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Align(alignment: Alignment.topCenter,child: Text(listDatosPersonajes[cg.indexMenuSelected!=0?cg.indexMenuSelected-1:0]['results'][0]['name']??'', style: cg.titleBlancoBIG,),),
                          Align(alignment: Alignment.topCenter,child: Image.asset(cg.listPersonajesFotos[cg.indexMenuSelected!=0?cg.indexMenuSelected-1:0], height: 436,)),
                          Align(alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(listDatosPersonajes[cg.indexMenuSelected!=0?cg.indexMenuSelected-1:0]['results'][0]['name']??'', style: cg.titleBlanco,),
                                Container( width: 500,child: Text(listDatosPersonajes[cg.indexMenuSelected!=0?cg.indexMenuSelected-1:0]['results'][0]['description']??'', style: cg.bodyBlancoPeque, maxLines: 2,)),
                                SizedBox(height: 20,),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: cg.primaryRojo)
                                  ),
                                  child: Icon(Icons.keyboard_arrow_down, color: cg.primaryRojo,),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 600,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(child: Text("Biografía", style: idSubMenu==0?cg.bodyResalted:cg.bodyNoResalted,),onPressed: (){idSubMenu=0; setState(() {});},),
                              TextButton(child: Text("Películas", style: idSubMenu==1?cg.bodyResalted:cg.bodyNoResalted),onPressed: (){idSubMenu=1;setState(() {});},),
                              TextButton(child: Text("Comics", style: idSubMenu==2?cg.bodyResalted:cg.bodyNoResalted),onPressed: (){idSubMenu=2;setState(() {});},),
                            ],
                          ),
                        ),
                        Container(
                          width: wView<1024?250:wView*0.7,
                          child: idSubMenu==0?Text(listDatosPersonajes[cg.indexMenuSelected!=0?cg.indexMenuSelected-1:0]['results'][0]['description']??''):
                          idSubMenu==1?Wrap(
                                    children: listDatosPersonajes[cg.indexMenuSelected!=0?cg.indexMenuSelected-1:0]['results'][0]['series']['items'].map<Widget>((e) =>
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  cg.primaryRojo,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16)),
                                                      child: Text(
                                                        e['name'],
                                                        style: cg.menuSelected,
                                                      ),
                                                    ),
                                        )
                                                ).toList(),
                                  ):Wrap(
                            children: listDatosPersonajes[cg.indexMenuSelected!=0?cg.indexMenuSelected-1:0]['results'][0]['comics']['items'].map<Widget>((e) =>
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                            cg.primaryRojo,
                                            width: 1),
                                        borderRadius:
                                        BorderRadius
                                            .circular(16)),
                                    child: Text(
                                      e['name'],
                                      style: cg.menuSelected,
                                    ),
                                  ),
                                )
                            ).toList(),
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 800,
                    decoration: BoxDecoration(
                        gradient:  LinearGradient(
                            colors: [Colors.black, cg.primaryNegro, cg.primaryMoradoOscuro],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        )
                    ),
                    child: cargando?Container(height: 100, width: 100, child: CircularProgressIndicator(),):Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text("Explora otros personajes", textAlign: TextAlign.center, style: cg.titlePequeBlanco,),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: horizontalController,
                                  itemCount: listDatosPersonajes.length,
                                  itemBuilder: (context, indexBuild){
                                    return PersonajeWidget(rutaImg: cg.listPersonajesFotos[indexBuild], titulo: listDatosPersonajes[indexBuild]['results'][0]['name'], descripcion: listDatosPersonajes[indexBuild]['results'][0]['description'], verMasFun: (){
                                      cg.indexMenuSelected=indexBuild+1;
                                      personajeSelected();
                                    });
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
                      ],
                    )
                  ),
                  FooterWidget(hView: hView, wView: wView)
                ],
              )
            ],
          ),
          SafeArea(
              child: MenuMarvelWidget(clickMenuHamb: clickMenuHamb,  keyScaf: scaffoldKey, personajeSelected: personajeSelected,)
          )
        ],
      ),
    );
  }

  void clickMenuHamb(GlobalKey<ScaffoldState> llave){
    llave.currentState.openDrawer();
  }

  void personajeSelected(){
    if(cg.indexMenuSelected==0){
      controllerPage.jumpToPage(0);
    }else{
      controllerPage.jumpToPage(1);
    }
    setState(() {});
  }

}
