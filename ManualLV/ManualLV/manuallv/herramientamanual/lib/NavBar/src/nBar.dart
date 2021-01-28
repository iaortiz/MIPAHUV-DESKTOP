import 'package:flutter/material.dart';
import 'package:herramientamanual/SearchBoards/src/searchBarName.dart';
import 'package:herramientamanual/SearchBoards/src/searchBarSoftware.dart';

class NBar extends StatefulWidget {
  @override
  _NBarState createState() => _NBarState();
}

class _NBarState extends State<NBar> {
  List<bool> selected = [true, false];

  void select(int n) {
    for (int i = 0; i < 2; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NBarItem(
            active: selected[0],
            texto: 'Nombre del recurso',
            touched: () {
              setState(() {
                select(0);
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SearchBarName();
                    });
              });
            },
          ),
          NBarItem(
            active: selected[1],
            texto: 'Programa',
            touched: () {
              setState(() {
                select(1);
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SearchBarSoftware();
                    });
              });
            },
          ),
        ],
      ),
    );
  }
}

class NBarItem extends StatefulWidget {
  final String texto;
  final Function touched;
  final bool active;

  NBarItem({this.active, this.touched, this.texto});

  @override
  _NBarItemState createState() => _NBarItemState(this.texto);
}

class _NBarItemState extends State<NBarItem> {
  final String texto;

  _NBarItemState(this.texto);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.touched();
        },
        splashColor: Color(0xff191919),
        hoverColor: Colors.white12,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 60.0,
                width: 250.0,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      height: 35.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                          color: widget.active
                              ? Color(0xffEAAB00)
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text(
                                texto,
                                style: TextStyle(
                                    color: Color(0xff191919),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.0),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
