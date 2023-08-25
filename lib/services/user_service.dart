
import '../models/user.dart';

class UserService {
  final List<User> users = [

    User(email: 'alex@gmail.com',password: 'alex', submittedBugsId:[1,2,3], starredBugsId:[1,2], ccBugsId:[]),
    User(email: 'a',password: 'a', submittedBugsId:[], starredBugsId:[], ccBugsId:[]),

    //Add more mock data here

  ];
}