import 'package:e_commerce_app/features/auth/presentations/screens/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/use_cases/register_use_case.dart';

@injectable
class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  /// todo: hold data - handle logic
  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);

    either.fold((l) {
      emit(RegisterErrorState(failures: l));
    }, (response) {
      emit(RegisterSuccessState(responseEntity: response));
    });
  }
}
