import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Gotham Narrow"),
        title: "Manual Laboratorio Virtual",
        home: Scaffold(
          backgroundColor: Color(0xffF2F2F2),
          body: Container(
            color: Color(0xff003F72),
            child: Home(),
          ),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> appItems = [
    "PROGRAMA UNO",
    "PROGRAMA DOS",
    "PROGRAMA TRES",
    "PROGRAMA CUATRO",
    "PROGRAMA CINCO",
    "PROGRAMA SEIS",
    "PROGRAMA SIETE"
  ];

  bool sidebarOpen = false;

  double xoffset = 300;
  double yoffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 64, top: 128, bottom: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 64),
                    alignment: Alignment.topLeft,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                        color: Color(0xffF2F2F2),
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: 0, bottom: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xffEAAB00),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text('Buscar',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w100,
                                        color: Color(0xff191919))),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Container(
                      child: Expanded(
                    child: ListView.builder(
                        itemCount: appItems.length,
                        itemBuilder: (context, index) => Container(
                              child: Row(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(
                                        top: 32,
                                        bottom: 16,
                                        left: 32,
                                        right: 32),
                                    child: FlatButton(
                                        onPressed: () {
                                          print(appItems[index]);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(appItems[index],
                                              style: TextStyle(
                                                  color: Color(0xffF2F2F2),
                                                  fontWeight: FontWeight.w900)),
                                        )))
                              ]),
                            )),
                  )),
                ],
              )),
          Container(
            margin: EdgeInsets.only(bottom: 16, left: 16),
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xffEAAB00),
            ),
          ),
          Container(
              transform: Matrix4.translationValues(xoffset, yoffset, 1.0),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: double.infinity,
              color: Color(0xffF2F2F2),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(64),
                      child: Text(
                        "Laboratorio de programación",
                        style: TextStyle(fontSize: 36),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
