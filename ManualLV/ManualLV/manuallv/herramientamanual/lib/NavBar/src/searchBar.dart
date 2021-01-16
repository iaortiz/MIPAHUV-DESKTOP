import 'dart:ui';

import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 64, left: 64),
      height: 60.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(30), bottomLeft: Radius.circular(30)),
          color: Color(0xffF2F2F2),
        ),
        alignment: Alignment.centerRight,
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Buscar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff191919),
                  fontSize: 24.0,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 32),
                child: FlatButton(
                    color: Color(0xffEAAB00),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search, color: Color(0xff191919)),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
