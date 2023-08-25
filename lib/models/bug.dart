import 'comment.dart';

class Bug {
  static int idCount = 1;
  final int id;
  final String title;
  final String product;
  final String description;
  final String severity;
  final String status;
  List<Comment> comments;
  List<String> ccUsers;
  bool isStarred;

  Bug({
    required this.title,
    required this.product,
    required this.description,
    required this.severity,
    this.status = "Open",
    List<Comment>? comments,
    this.ccUsers = const [],
    this.isStarred = false,
  }) : comments = [...?comments], id = idCount++;

}