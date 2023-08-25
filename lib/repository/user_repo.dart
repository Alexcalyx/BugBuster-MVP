
import '../models/user.dart';
import 'package:collection/collection.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService userService = UserService();
  User? _loggedInUser;

  User? get loggedInUser => _loggedInUser;

  void setLoggedInUser(User? user) {
    _loggedInUser = user;
  }

  User? getUserByEmail(String email) {
    return userService.users.firstWhereOrNull((user) => user.email == email);
  }

  void addUser(User user) {
    userService.users.add(user);
  }

  bool authenticate(String email, String password) {
    final user = getUserByEmail(email);
    if (user != null) {
      // NOTE: This is a simple check. In a real-world app, you'd have encrypted passwords and more sophisticated checks.
      return password == user.password;
    }
    return false;
  }
}