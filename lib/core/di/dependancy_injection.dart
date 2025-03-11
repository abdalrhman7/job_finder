import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:JobFinder/core/netwoking/api_service.dart';
import 'package:JobFinder/core/netwoking/dio_factory.dart';
import 'package:JobFinder/features/applied_job/data/repo/applied_job_repo.dart';
import 'package:JobFinder/features/apply_job/data/repo/apply_job_repo.dart';
import 'package:JobFinder/features/chat/data/repo/chat_repo.dart';
import 'package:JobFinder/features/home/data/repo/home_repo.dart';
import 'package:JobFinder/features/home/logic/get_jobs_cubit/get_jobs_cubit.dart';
import 'package:JobFinder/features/login/data/repo/login_repo.dart';
import 'package:JobFinder/features/login/logic/login_cubit.dart';
import 'package:JobFinder/features/profile/data/repo/profile_repo.dart';
import 'package:JobFinder/features/saved/data/repo/save_job_repo.dart';
import 'package:JobFinder/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:JobFinder/features/sign_up/logic/sign_up_cubit.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt<ApiService>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignupRepo>()));
  //

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  //

  //home
 // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  getIt.registerFactory<GetJobsCubit>(() => GetJobsCubit(getIt<HomeRepo>()));

  // saved jop
  getIt.registerLazySingleton<SaveJobRepo>(() => SaveJobRepo(getIt<ApiService>()));

  //apply jop
  getIt.registerLazySingleton<ApplyJobRepo>(() => ApplyJobRepo(getIt<ApiService>()));

  // chat
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt<ApiService>()));

  //AppliedJob
  getIt.registerLazySingleton<AppliedJobRepo>(() => AppliedJobRepo(getIt<ApiService>()));

  //profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt<ApiService>()));
}
