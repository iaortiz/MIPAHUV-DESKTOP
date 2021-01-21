import 'package:cloud_firestore/cloud_firestore.dart';

class Commentaries{
String content, resourceID, user;
double score;
Timestamp createdAt;

Commentaries(
  String content, String resourceID, String user, double score, Timestamp createdAt
){

  this.content = content;
  this.resourceID = resourceID;
  this.user = user;
  this.score = score;
  this.createdAt = createdAt;
}
}