import 'package:bloc/bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit() : super(const SignUpState());


  bool verifyUsername(String username){
    RegExp usernameRegExp = RegExp(r'^([A-Z][a-z]+)( [A-Z][a-z]+)*$');
    return usernameRegExp.hasMatch(username);

  }
  bool verifyPassword(String password){
    RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  bool verifyemailname(String email) {
    RegExp emailRegExp = RegExp(r'^[^\s@]{2,}@gmail\.com$');
    return emailRegExp.hasMatch(email);
  }

  void onchangeUsername(String username){
    if(!verifyUsername(username)){
      emit(
        state.copyWith(
          usernameError: 
            'Nhập in hoa các chữ cái đầu trong tên'
        ),
      );
    }
  }

  void onchangeemmail(String email) {
    if (!verifyemailname(email)) {
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
      state.emailError.isEmpty && state.passwordError.isEmpty && state.usernameError.isEmpty;

  void signup(String username,String email, String password) async {
    emit(state.copyWith(isLoading: true)); 
    await Future.delayed(const Duration(seconds: 5)); 
    // Giả sử đăng nhập thành công
      emit(state.copyWith(isLoginSuccess: true, isLoading: false));
  }
}