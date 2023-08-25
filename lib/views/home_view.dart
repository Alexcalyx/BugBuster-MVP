import 'package:flutter/material.dart';
import '../controller/bug_controller.dart';
import '../models/bug.dart';
import '../repository/bug_repo.dart';
import '../repository/user_repo.dart';
import 'bug_detail_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Bug> _allBugs = []; // Contains all the bugs
  List<Bug> _filteredBugs = []; // Contains bugs based on user's search
  final BugRepository _bugRepo = BugRepository();
  final UserRepository _userRepo = UserRepository();

  @override
  void initState() {
    super.initState();
    _allBugs = _bugRepo.getAllBugs();
  }

  void _filterBugs(String query) {
    List<String> components = query.split(' ');
    List<Bug> tempBugs = List.from(_allBugs);  // Starting with all bugs

    for (String component in components) {
      String? key;
      String value;

      if (component.contains(':')) {
        // Compound search
        var parts = component.split(':');
        key = parts[0].toLowerCase();
        value = parts[1].toLowerCase();
      } else {
        value = component.toLowerCase();
      }

      tempBugs = tempBugs.where((bug) {
        switch (key) {
          case 'severity':
            return bug.severity.toLowerCase() == value;
          case 'title':
            return bug.title.toLowerCase().contains(value);
          case 'cc':
            return bug.ccUsers.any((email) => email.toLowerCase().contains(value));
        // ... other fields

          default:
          // Default search across all fields
            return bug.title.toLowerCase().contains(value) ||
                bug.description.toLowerCase().contains(value) ||
                bug.severity.toLowerCase().contains(value) ||
                bug.status.toLowerCase().contains(value) ||
                bug.product.toLowerCase().contains(value) ||
                bug.comments.any((comment) => comment.text.toLowerCase().contains(value)) ||
                bug.ccUsers.any((email) => email.toLowerCase().contains(value));
        }
      }).toList();
    }

    setState(() {
      _filteredBugs = tempBugs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bug Tracker'),
        actions: [IconButton(icon: Icon(Icons.person), onPressed: () {/* TODO: Navigate to profile */})],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterBugs,
              decoration: InputDecoration(
                labelText: 'Search bugs',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredBugs.length,
              itemBuilder: (context, index) {
                final bug = _filteredBugs[index];

                return ListTile(
                  title: Text(bug.title),
                  subtitle: Text('${bug.product} | ${bug.status} | ${bug.severity}'),
                  trailing: bug.isStarred ? Icon(Icons.star) : null,
                  onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BugDetailView(bug: bug),
                      ));
                    }
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              var result = await Navigator.pushNamed(context, '/createBug');
              if (result != null && result is Bug) {
                setState(() {
                  _allBugs.add(result);
                });
              }
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}