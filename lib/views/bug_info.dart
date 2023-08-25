//Jen's branch

import 'package:flutter/material.dart';

import '../models/bug.dart';

class CommentItem extends StatelessWidget {
  final String username;
  final String datetime;
  final String comment;

  CommentItem({
    required this.username,
    required this.datetime,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'assets/images/user.png',
                      width: 25.0,
                      height: 25.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Text(datetime),
          Text(comment),
          Divider(),
        ],
      ),
    );
  }
}

class BugInfo extends StatelessWidget {
  final Bug bug;  // Accept the bug data here
  BugInfo({required this.bug});

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: DynamicAppBar(
        title: bug.title,
        dynamicImageAssets: [],
        appBarColor: Color.fromARGB(255, 103, 123, 135),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.0),
              BoxWithTitle(
                title: 'Description',
                description: bug.description,
                imageAsset: 'assets/images/document.png',
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInlineSection('Reporter', 'alex@gmail.com'),
                    buildInlineSection('Priority', bug.severity),
                    buildInlineSection('Status', bug.status),
                    buildInlineSection('Assignee', 'jain**********@google.com'),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COMMENTS',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      children: [
                        CommentItem(
                          username: 'Jen Zapanta <jain**********@google.com>',
                          datetime: 'Aug 22, 2023',
                          comment: 'This app is okayish',
                        ),
                        CommentItem(
                          username: 'Rajarshi <be********@google.com>',
                          datetime: 'Aug 23, 2023',
                          comment: 'hahaha!',
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      maxLines: 6,
                      controller: TextEditingController()..text = 'Add a comment.',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                      ),
                      onTap: () {
                        TextEditingController().clear();
                      },
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Implement functionality for the first button here
                          },
                          child: Container(
                            color: Color.fromARGB(255, 103, 123, 135),
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Comment',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        InkWell(
                          onTap: () {
                            // Implement functionality for the second button here
                          },
                          child: Image.asset(
                            'assets/images/clip.png',
                            width: 20.0,
                            height: 20.0,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        InkWell(
                          onTap: () {
                            // Implement functionality for the third button here
                          },
                          child: Image.asset(
                            'assets/images/google-drive.png',
                            width: 15.0,
                            height: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInlineSection(String title, dynamic content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10), // Add spacing between title and content
          if (content is List)
            Expanded(
              child: Wrap(
                spacing: 4.0,
                children: content.map((cc) => Chip(label: Text(cc))).toList(),
              ),
            )
          else
            Text(content),
        ],
      ),
    );
  }
}

class DynamicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> dynamicImageAssets;
  final Color appBarColor; // Define appBarColor here

  const DynamicAppBar({
    required this.title,
    required this.dynamicImageAssets,
    required this.appBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              for (var asset in dynamicImageAssets)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    asset,
                    width: 17,
                    height: 17,
                    color: Colors.white,
                  ),
                ),
              SizedBox(width: 15),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold, // Make the title bolder
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class BoxWithTitle extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const BoxWithTitle({
    required this.title,
    required this.description,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageAsset,
            width: 20,
            height: 20,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
