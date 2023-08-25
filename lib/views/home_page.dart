import 'package:flutter/material.dart';
import '../models/bug.dart';
import '../repository/bug_repo.dart';
import '../views/content.dart';
import '../views/sidebar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collapsible Sidebar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  bool _isSearchInitiated = false;
  bool _isSidebarCollapsed = true;
  List<Bug> _allBugs = [];
  List<Bug> _filteredBugs = [];
  final BugRepository _bugRepo = BugRepository();

  @override
  void initState() {
    super.initState();
    _allBugs = _bugRepo.getAllBugs();
    _filteredBugs = _allBugs; // By default, show all bugs

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  void _filterBugs(String query) {
    if (query.isEmpty) {
      _isSearchInitiated = false;
      setState(() {
        _filteredBugs = _allBugs;
      });
      return;
    }

    _isSearchInitiated = true;
    List<String> components = query.split(' ');
    List<Bug> tempBugs = List.from(_allBugs); // Starting with all bugs

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
            return bug.ccUsers
                .any((email) => email.toLowerCase().contains(value));
          // ... other fields

          default:
            // Default search across all fields
            return bug.title.toLowerCase().contains(value) ||
                bug.description.toLowerCase().contains(value) ||
                bug.severity.toLowerCase().contains(value) ||
                bug.status.toLowerCase().contains(value) ||
                bug.product.toLowerCase().contains(value) ||
                bug.comments.any(
                    (comment) => comment.text.toLowerCase().contains(value)) ||
                bug.ccUsers.any((email) => email.toLowerCase().contains(value));
        }
      }).toList();
    }

    setState(() {
      _filteredBugs = tempBugs;
    });
  }

  void toggleSidebar() {
    setState(() {
      _isSidebarCollapsed = !_isSidebarCollapsed;
      if (_isSidebarCollapsed) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            onPressed: toggleSidebar,
          ),
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
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 229, 229),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          onChanged: _filterBugs,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ], // children
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color:
                  Colors.white, // Set the background color of the main content
              child: Column(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: _isSearchInitiated
                        ? Content(bugs: _filteredBugs)
                        : Content(bugs: []),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: _isSidebarCollapsed
                ? -200
                : 0, // Set the left position based on sidebar visibility
            width: 200, // Set the sidebar width
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(117, 158, 158, 158),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Sidebar(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
