import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';
import 'core/routing/routes.dart';

class JobFinder extends StatelessWidget {
  final AppRouter appRouter;

  const JobFinder({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Doc App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,

        ),

        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: AppConstants.isLoggedInUser ? Routes.bottomNavBar : Routes.loginScreen,
      ),
    );
  }
}
