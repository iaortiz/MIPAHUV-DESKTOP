import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:herramientamanual/Data/coment.dart';

import 'commentCard.dart';

FirebaseApp secondaryApp = Firebase.app('herramientamanual');
FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: secondaryApp);
var result;
bool _initialized = false;
bool _error = false;
List<Widget> resources = [];
List<Commentary> aux = [];
Commentary commentary;
Widget resource;
double score;
double auxScore;
var valueAux;

// ignore: must_be_immutable
class CommentariesListName extends StatefulWidget {
  String value;
  CommentariesListName(String value) {
    this.value = value;
    valueAux = this.value;
  }

  @override
  _CommentaryListState createState() => _CommentaryListState();
}

class _CommentaryListState extends State<CommentariesListName> {
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      _error = true;
    }
  }

  Future loadResources() async {
    result = await FirebaseFirestore.instance
        .collection('commentaries')
        .where('resourceID', isEqualTo: widget.value)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                setState(() {
                  commentary = new Commentary(
                      doc['content'],
                      doc['resourceID'],
                      doc['user'],
                      doc['score'],
                      doc['createdAt'],
                      doc.reference.id);
                  print(commentary.id + " / " + commentary.score.toString());
                  aux.add(commentary);
                  resource = CommentaryCard(commentary);
                  resources.add(resource);
                });
              })
            });

    setState(() {
      for (var i = 0; i < aux.length; i++) {
        score = score + aux[i].score;
      }

      auxScore = score / aux.length;
    });
  }

  @override
  void initState() {
    initializeFlutterFire();
    resources = [];
    aux = [];
    score = 0;
    auxScore = 0;
    super.initState();
    loadResources();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Text('Error, volver a cargar');
    }
    if (!_initialized) {
      return Text('Cargando');
    }

    return DataList();
  }
}

class DataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: Text(
                    'COMENTARIOS',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Calificación: ',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                    ),
                    Text(
                      auxScore.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 26),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Color(0xffEAAB00),
                    onPressed: () {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              content: Text(valueAux),
                            );
                          });
                    },
                    child: Icon(
                      Icons.add,
                      color: Color(0xff191919),
                    ),
                  ),
                )
              ],
            )),
        backgroundColor: Color(0xffF2F2F2),
        content: resources.isNotEmpty
            ? Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                width: MediaQuery.of(context).size.width / 2,
                child: ListView.builder(
                    itemCount: resources.length,
                    itemBuilder: (context, index) {
                      return Container(width: 500, child: resources[index]);
                    }),
              )
            : Text('No hay comentarios'));
  }
}
