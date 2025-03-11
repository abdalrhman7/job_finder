import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:JobFinder/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:JobFinder/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signupRepo) : super(SignUpInitial());
  final SignupRepo _signupRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(SignUpLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (_) {
      emit(SignUpSuccess());
    }, failure: (errorMessage) {
      emit(SignUpFailure(errorMessage));
    });
  }
}
