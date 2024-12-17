import 'package:e_commerce_app/features/auth/presentations/screens/sign_in/cubit/sign_in_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/login_use_case.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  var emailController = TextEditingController(text: "ss987@gmail.com");
  var passwordController = TextEditingController(text: "sara123456");

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  /// todo: hold data - handle logic
  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
      emailController.text,
      passwordController.text,
    );
    either.fold((l) {
      emit(LoginErrorState(failures: l));
    }, (response) {
      emit(LoginSuccessState(responseEntity: response));
    });
  }
}
