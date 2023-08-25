import 'package:flutter/material.dart';

// Inside the Sidebar class
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed('/createBug');
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 35,
                    ),
                    label: const Text(
                      'Create Issue',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.only(left: 5.0), // Adjust the padding
                child: const Icon(Icons.person),
              ),
              title: const Text(
                'Assigned to me',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.only(left: 5.0), // Adjust the padding
                child: const Icon(Icons.star),
              ),
              title: const Text(
                'Starred by me',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.only(left: 5.0), // Adjust the padding
                child: const Icon(Icons.person_add),
              ),
              title: const Text(
                "CC'd to me",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.only(left: 5.0), // Adjust the padding
                child: const Icon(Icons.bug_report),
              ),
              title: const Text(
                'Reported by me',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
