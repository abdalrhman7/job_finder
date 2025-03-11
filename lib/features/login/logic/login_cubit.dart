import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:JobFinder/core/helper/constants.dart';
import 'package:JobFinder/core/helper/shared_pref_helper.dart';
import 'package:JobFinder/core/netwoking/dio_factory.dart';
import 'package:JobFinder/features/login/data/models/login_request_body.dart';
import 'package:JobFinder/features/login/data/models/login_response.dart';
import 'package:JobFinder/features/login/data/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());

 final LoginRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(LoginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (LoginResponse loginResponse) {
      emit(LoginSuccess());
      saveUserTokenAndId(token:loginResponse.token ?? '' ,userId: loginResponse.user?.id.toString() ?? '');
    }, failure: (errorMessage) {
      emit(LoginFailure(message: errorMessage));
    });
   }

  Future<void> saveUserTokenAndId({required String token , required String userId}) async {
    // print('kkkkkkkkk ${await SharedPrefHelper.getString(SharedPrefKeys.userId)}');
    DioFactory.setTokenIntoHeaderAfterLogin(token);
    await SharedPrefHelper.setData(SharedPrefKeys.userId, userId);
    AppConstants.userId = await SharedPrefHelper.getString(SharedPrefKeys.userId);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }

}
