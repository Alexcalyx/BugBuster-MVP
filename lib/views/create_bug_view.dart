import 'package:flutter/material.dart';
import '../models/bug.dart';
import '../models/severity.dart';
import '../repository/bug_repo.dart';

class CreateBugView extends StatefulWidget {
  @override
  _CreateBugViewState createState() => _CreateBugViewState();
}

class _CreateBugViewState extends State<CreateBugView> {
  final _formKey = GlobalKey<FormState>();
  String? selectedProduct;  // Default product, you can adjust
  String title = "";
  String description = "";
  Severity? severity = Severity.low;
  final bugRepo = BugRepository();

  // Mock product list
  final List<String> products = [
    'Mojango',
    'PrintMaster',
    'SmartGadget',
    'DataSync Pro',
    'VideoVista',
    'ShopCart',
    'CamFocus',
    'Chaman Khaman',
    'NavMaster',
    'MusicMixer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.grey),
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
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButton<String>(
                hint: Text("Select a product"),
                value: selectedProduct, // maintain a state variable for this
                items: products.map((String product) {
                  return DropdownMenuItem<String>(
                    value: product,
                    child: Text(product),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedProduct = newValue!;
                  });
                },
              ),

              SizedBox(height: 15.0),

              Text(
                'Title',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 103, 123, 135),
                ),
              ),
              SizedBox(height: 10.0),


              TextFormField(
                obscureText: false,
                cursorColor:const Color.fromARGB(255, 103, 123, 135) ,

                decoration: InputDecoration(labelText: '',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color.fromARGB(255, 103, 123, 135).withOpacity(0.4),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,

                  ),),

                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              Text(
                'Description',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 103, 123, 135),
                ),
              ),
              SizedBox(height: 10.0),

              TextFormField(
                obscureText: false,
                cursorColor:const Color.fromARGB(255, 103, 123, 135) ,

                decoration: InputDecoration(labelText: '',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color.fromARGB(255, 103, 123, 135).withOpacity(0.4),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,

                  ),),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),

              Text(
                'Severity',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 103, 123, 135),
                ),
              ),
              SizedBox(height: 10.0),

              DropdownButtonFormField(
                focusColor: Color.fromARGB(255, 103, 123, 135),
                style: TextStyle(
                  color: Color.fromARGB(255, 103, 123, 135) ,
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(labelText: '',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color.fromARGB(255, 103, 123, 135).withOpacity(0.4),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,

                  ),),
                items: Severity.values.map((severity) {
                  return DropdownMenuItem(
                    value: severity,
                    child: Text(severity.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    severity = value;
                  });
                },
                value: severity,

              ),
              SizedBox(height: 12.0,),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Save the bug to your repository and go back to the home page
                    Bug newBug = Bug(
                      title: title,
                      product: selectedProduct ?? "Mojango", // Default to "A" if null
                      description: description,
                      severity: (severity ?? Severity.low).toString().split('.').last, // Default to low if null
                    );

                    // Add the bug to the repository
                    bugRepo.createBug(newBug);

                    Navigator.of(context).pop(newBug); // Return the new bug
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Submit',
                  style: TextStyle(fontSize: 16.0,
                    color: Color.fromARGB(255, 103, 123, 135),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

