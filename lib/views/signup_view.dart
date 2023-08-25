import 'package:flutter/material.dart';
import '../models/user.dart';
import '../repository/user_repo.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  void _signup() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Passwords do not match!')));
      return;
    }

    if (_userRepository.getUserByEmail(email) != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User already exists!')));
      return;
    }

    // Create the user and add to the repository
    final user = User(email: email, password: password, submittedBugsId: [], starredBugsId: [], ccBugsId: []);

    _userRepository.addUser(user);

    // Navigate back to login or directly to the home screen
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Column(
        children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
          TextField(controller: _confirmPasswordController, decoration: InputDecoration(labelText: 'Confirm Password'), obscureText: true),
          ElevatedButton(onPressed: _signup, child: Text('Sign up')),
        ],
      ),
    );
  }
}
