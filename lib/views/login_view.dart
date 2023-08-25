import 'package:flutter/material.dart';
import '../models/user.dart';
import '../repository/user_repo.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    UserRepository userRepository = UserRepository();
    User? user = userRepository.getUserByEmail(email);
    if (user != null && userRepository.authenticate(email, password)) {
      userRepository.setLoggedInUser(user);
      // Navigate to home view if authentication is successful
      Navigator.pushNamed(context, '/home');
    } else {
      // Show a dialog or snackbar indicating login failed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(
        children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
          ElevatedButton(onPressed: _login, child: Text('Login')),
          TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'), child: Text('Sign up'))
        ],
      ),
    );
  }
}
