import 'package:flutter/material.dart';
import 'package:blog_application/models/blog.dart';
import 'package:blog_application/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
class BlogProvider with ChangeNotifier {
  late String _title;
  late String _category;
  late String _description;
  late String _blogId;
  var uuid = Uuid();
  final firestoreService = FirestoreService();
  //Getters
  String get title => _title;
  String get category => _category;
  String get description => _description;
  //Setters
  changeTitle(String value){
    _title=value;
    notifyListeners();
  }

  changeCategory(String value){
    _category= value;
    notifyListeners();
  }

  changeDescription(String value){
    _description= value;
    notifyListeners();
  }

  saveBlog(){
    Blog(title: title, category: category,description: description,blogId: uuid.v4());
    firestoreService.saveBlog(title,category,description);
  }
}
