import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blog_application/models/blog.dart';
class FirestoreService {
  String? uuid;
  FirestoreService({ this.uuid });
  final CollectionReference _db = FirebaseFirestore.instance.collection("blogs");
  Future saveBlog(
      String title,
      String category,
      String description
      ) async {
    return await _db.doc(uuid).set({
      "title": title,
      "category": category,
      "description": description
    });
  }

  Stream<List<Blog>> getBlog(){
    FirebaseFirestore _db = FirebaseFirestore.instance;
    return _db.collection('blogs').snapshots().map((snapshot) => snapshot.docs.map((document) => Blog.fromFirestore(document.data())).toList());
  }
}