import 'package:flutter/material.dart';
import 'package:herramientamanual/DashBoard/dashBoard.dart';
import 'package:herramientamanual/NavBar/NavBar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'Gotham Narrow'),
      debugShowCheckedModeBanner: true, //Cuando se acabe se convierte en true
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF2F2F2),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            NavBar(),
            Dashboard(),
            Align(//botón para ajustes del app
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.all(32),
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Color(0xff191919),
                    foregroundColor: Color(0xffF2F2F2),
                    onPressed: () {
                    },
                    child: Icon(Icons.settings),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
