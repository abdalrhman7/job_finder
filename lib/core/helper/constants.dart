import 'package:JobFinder/features/login/data/models/login_response.dart';
import 'package:JobFinder/features/profile/data/model/profile_model.dart';

class AppConstants {
  static bool isLoggedInUser = false;
   static String userId = '';
   static UserData userData = UserData();
}

class SharedPrefKeys {
  static const String userToken = 'userToken';
   static const String userId = 'userId';
  static const String userData = 'userData';
}

