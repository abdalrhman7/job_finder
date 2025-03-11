import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:JobFinder/core/di/dependancy_injection.dart';
import 'package:JobFinder/core/routing/routes.dart';
import 'package:JobFinder/features/bottom_nav_bar/ui/bottom_nav_bar.dart';
import 'package:JobFinder/features/home/data/repo/home_repo.dart';
import 'package:JobFinder/features/home/logic/get_jobs_cubit/get_jobs_cubit.dart';
import 'package:JobFinder/features/job_details/ui/job_details_screen.dart';
import 'package:JobFinder/features/login/data/repo/login_repo.dart';
import 'package:JobFinder/features/login/logic/login_cubit.dart';
import 'package:JobFinder/features/login/ui/login_screen.dart';
import 'package:JobFinder/features/saved/data/repo/save_job_repo.dart';
import 'package:JobFinder/features/saved/logic/save_job_cubit.dart';
import 'package:JobFinder/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:JobFinder/features/sign_up/logic/sign_up_cubit.dart';
import 'package:JobFinder/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingScreen(),
      //   );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => LoginCubit(getIt<LoginRepo>()),
              child: LoginScreen(),
            );
          },
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<SignUpCubit>(
              create: (context) => SignUpCubit(getIt<SignupRepo>()),
              child: SignUpScreen(),
            );
          },
        );
      case Routes.bottomNavBar:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => GetJobsCubit(getIt<HomeRepo>()),
                ),
                BlocProvider(
                  create: (context) => SaveJobCubit(getIt<SaveJobRepo>())..getSavedJobs(),
                ),
              ],
              child: const BottomNavbar(),
            );
          },
        );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => HomeCubit(getIt())..getSpecializations(),
      //       child: const HomeScreen(),
      //     ),
      //   );
      default:
        return null;
    }
  }
}
