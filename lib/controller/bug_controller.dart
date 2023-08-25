// This controller interacts with the BugRepository to manage bug-related actions.
// It has methods for actions like creating a bug or starring a bug.

import '../models/bug.dart';
import '../models/comment.dart';
import '../models/user.dart';
import '../repository/bug_repo.dart';

class BugController {
  final BugRepository _repository;
  final User _user;

  BugController(this._repository, this._user);

  List<int> get userSubmittedBugs => _user.submittedBugsId;

  List<int> get userStarredBugs => _user.starredBugsId;

  List<int> get userCCBugs => _user.ccBugsId;

  void addCommentToBug(Bug bug, String commentText, User user) {
    Comment comment = Comment(
        userId: user.email,
        text: commentText,
        timestamp: DateTime.now()
    );
    bug.comments.insert(0, comment); // We're adding to the beginning for a reverse chronological display
    print("Bug in Controller: $bug");

  }

  void createBug(Bug bug) {
    _repository.createBug(bug);
    _user.submittedBugsId.add(bug.id);
  }

  void starBug(Bug bug) {
    bug.isStarred = !bug.isStarred;
    if (bug.isStarred) {
      _user.starredBugsId.add(bug.id);
    } else {
      _user.starredBugsId.remove(bug.id);
    }
  }

  void ccUser(Bug bug, User ccUser) {
    if (!bug.ccUsers.contains(ccUser.id)) {
      bug.ccUsers.add(ccUser.email);
      ccUser.ccBugsId.add(bug.id);
    }
  }

// ... other necessary methods.
}