import 'package:flutter/material.dart';
import '../models/bug.dart';
import 'bug_info.dart';

class Content extends StatelessWidget {
  final List<Bug> bugs;

  // Add a constructor to accept the list of bugs
  Content({required this.bugs});

  @override
  Widget build(BuildContext context) {
    if (bugs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Image.asset(
              'assets/images/content_bg.jpg',
              width: 200.0,
              height: 200.0,
            ),
            const Text(
              'No issues to display.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    }

    // Display the filtered bugs if there are any
    return ListView.builder(
      itemCount: bugs.length,
      itemBuilder: (context, index) {
        final bug = bugs[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BugInfo(bug: bug), // pass the bug data to BugInfo
              ),
            );
          },
          child: ListTile(
            title: Text(bug.title),
            subtitle: Text(bug.description),
          ),
        );
      },
    );

  }
}
