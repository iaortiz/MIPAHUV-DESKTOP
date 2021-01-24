import 'package:flutter/material.dart';
import 'package:herramientamanual/Data/coment.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CommentaryCard extends StatefulWidget {
  Commentary aux;
  var auxDate;
  var auxTimestamp;
  CommentaryCard(Commentary auxR) {
    this.aux = auxR;
    this.auxTimestamp = this.aux.createdAt.toDate();
    this.auxDate = DateFormat.yMMMd().format(this.auxTimestamp);
  }

  @override
  _ResourceCardState createState() => _ResourceCardState();
}

class _ResourceCardState extends State<CommentaryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        color: Color(0xffF2F2F2),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFE0DED8), width: 2),
            borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Row(
                children: [
                  Text(
                    'USUARIO: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    widget.aux.user,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              subtitle: Text(
                widget.aux.content,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'FECHA: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      widget.auxDate,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
