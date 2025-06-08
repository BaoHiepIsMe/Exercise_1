import 'package:bloc/bloc.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  bool verifyPassword(String password){
    RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  bool verifyUsername(String email) {
    RegExp emailRegExp = RegExp(r'^[^\s@]{2,}@gmail\.com$');
    return emailRegExp.hasMatch(email);
  }

  void onchangeUsername(String email) {
    if (!verifyUsername(email)) {
      emit(
        state.copyWith(
          emailError:
              'Nhập đúng định dạng email gồm tên và @gmail.com',
        ),
      );
    } else {
      emit(state.copyWith(emailError: ''));
    }
  }
  void onchangePassword(String password) {
    if (!verifyPassword(password)) {
      emit(
        state.copyWith(
          passwordError:
              'Vui lòng nhập mật khẩu có ít nhất 6 kí tự, chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số',
        ),
      );
    } else {
      emit(state.copyWith(passwordError: ''));
    }
  }

  bool get isEnableButton =>
      state.emailError.isEmpty && state.passwordError.isEmpty;

  void login(String username, String password) async {
   emit(state.copyWith(isLoading: true)); 
    await Future.delayed(const Duration(seconds: 1)); 
 
    // Giả sử đăng nhập thành công
      emit(state.copyWith(isLoginSuccess: true, isLoading: false));
  }
}