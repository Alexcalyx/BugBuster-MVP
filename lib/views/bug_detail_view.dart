// bug_detail_view.dart

import 'package:flutter/material.dart';
import '../models/bug.dart';
import '../views/bug_info.dart';

class BugDetailView extends StatefulWidget {
  final Bug? bug;

  BugDetailView({required this.bug});

  @override
  _BugDetailViewState createState() => _BugDetailViewState();
}

class _BugDetailViewState extends State<BugDetailView> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        title: widget.bug?.title ?? "Bug Details",
        dynamicImageAssets: [
          'assets/images/arrow.png',
          'assets/images/refresh.png',
          'assets/images/star.png',
        ],
        appBarColor: Color.fromARGB(255, 103, 123, 135),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.0),
              BoxWithTitle(
                title: 'Description',
                description: widget.bug?.description ?? '',
                imageAsset: 'assets/images/document.png',
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // You can add more details in a similar manner
                    buildInlineSection('Product', widget.bug?.product ?? ''),
                    buildInlineSection('Severity', widget.bug?.severity ?? ''),
                    buildInlineSection('Status', widget.bug?.status ?? ''),
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
                    ...widget.bug?.comments.map(
                          (comment) => CommentItem(
                        username: comment.userId, // Ideally, replace this with actual user details.
                        datetime: 'Unknown Date', // Adjust this to show the actual comment date.
                        comment: comment.text,
                      ),
                    ) ??
                        [],
                    SizedBox(height: 16.0),
                    TextField(
                      maxLines: 6,
                      controller: _commentController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.0,
                      ),
                      onTap: () {
                        _commentController.clear();
                      },
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        InkWell(
                          onTap: _addComment,
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
                        // ... (You can add more icons or functionality here as needed)
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

  void _addComment() {
    // Existing logic for adding comment
  }

  Widget buildInlineSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Text(content),
        ],
      ),
    );
  }
}
