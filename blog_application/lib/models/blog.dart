class Blog {
  String blogId;
  String title;
  String description;
  String category;

  Blog(
      {required this.blogId,
      required this.title,
      required this.category,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'blogId': blogId,
      'title': title,
      'description': description,
      'category': category
    };
  }

  Blog.fromFirestore(Map<String, dynamic> firestore)
      : blogId = firestore['blogId'],
        title = firestore['title'],
        category = firestore['category'],
        description = firestore['description'];
}
