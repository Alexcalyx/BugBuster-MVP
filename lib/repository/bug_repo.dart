
import '../models/bug.dart';
import '../services/bug_service.dart';

class BugRepository {
  final BugService _service;
  static final BugRepository _singleton = BugRepository._internal(BugService());

  factory BugRepository() {
    return _singleton;
  }

  BugRepository._internal(this._service);

  List<Bug> getAllBugs() => _service.getAllBugs();

  void createBug(Bug bug) => _service.addBug(bug);

// ... More methods
}