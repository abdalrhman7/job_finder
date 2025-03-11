import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/di/dependancy_injection.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/extensions.dart';
import 'package:JobFinder/core/helper/shared_pref_helper.dart';

import 'core/routing/app_router.dart';
import 'jop_finder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  await getUserId();
  runApp(JobFinder(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    AppConstants.isLoggedInUser = false;
  } else {
    AppConstants.isLoggedInUser = true;
  }
}

Future<void> getUserId() async {
  AppConstants.userId = await SharedPrefHelper.getString(SharedPrefKeys.userId);
}
