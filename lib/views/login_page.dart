import 'package:flutter/material.dart';
import '../models/user.dart';
import '../repository/user_repo.dart';
import '../views/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login failed!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/images/bug.png',
                width: 40,
                height: 40,
              ),
            ),
            const Text(
              'BugBuster',
              style: TextStyle(
                color: Color.fromARGB(255, 130, 130, 130),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0), // Add spacing at the top
            const Text(
              'Welcome Back!',
              style: TextStyle(
                color: Color.fromARGB(255, 103, 123, 135),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                color: Color.fromARGB(255, 103, 123, 135),
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _emailController,
                cursorColor: const Color.fromARGB(255, 103, 123, 135),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  fillColor:
                      const Color.fromARGB(255, 103, 123, 135).withOpacity(0.4),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // Set round edges
                    borderSide: BorderSide.none, // Remove border
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 103, 123, 135),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                cursorColor: const Color.fromARGB(255, 103, 123, 135),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  fillColor:
                      const Color.fromARGB(255, 103, 123, 135).withOpacity(0.4),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // Set round edges
                    borderSide: BorderSide.none, // Remove border
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 103, 123, 135),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: TextButton(
                  onPressed: () {
                    // Add forgot password functionality here
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 103, 123, 135),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              width: 350.0,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 103, 123, 135),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Or Login With',
                  style: TextStyle(
                    color: Color.fromARGB(255, 103, 123, 135),
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add Facebook login functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Facebook',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add Google login functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  icon: const Icon(
                    Icons.account_circle_sharp,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Google',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 103, 123, 135),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
