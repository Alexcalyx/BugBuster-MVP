
class User {
  static int idCount=1;
  final int id;
  final String email;
  final String password;
  final List<int> submittedBugsId;
  final List<int> starredBugsId;
  final List<int> ccBugsId;

  User({
    required this.email,
    required this.submittedBugsId,
    required this.starredBugsId,
    required this.ccBugsId,
    required this.password,
  }) : id = idCount++ ;
}