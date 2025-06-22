import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:login/signup_page/data/signuprequest.dart';
import 'package:login/start_main/linkCallApi.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit() : super(const SignUpState());


  bool verifyUsername(String username){
      return username.trim().isNotEmpty;
  }
   bool verifyLastname(String firstName){
      return firstName.trim().isNotEmpty;
  }
   bool verifyFirstname(String lastName){
      return lastName.trim().isNotEmpty;
  }
  bool verifyPassword(String password){
    RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  bool verifyemailname(String email) {
    RegExp emailRegExp = RegExp(r'^.{2,}@');
    return emailRegExp.hasMatch(email);
  }

  void onchangeUsername(String username){
    if(!verifyUsername(username)){
      emit(
        state.copyWith(
          usernameError: 
            'Không để tên trống'
        ),
      );
    }else {
      emit(state.copyWith(usernameError: ''));
    }
  }
  

  void onchangeEmmail(String email) {
    if (!verifyemailname(email)) {
      emit(
        state.copyWith(
          emailError:
              'Nhập đúng định dạng email',
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
  final Dio dio = Dio();
  Future<void> signup(String username,String firstName,String lastName,String email, String password) async{
    emit(state.copyWith(isLoading: true));
    try {
      final response = await dio.post(
        SIGNUP_POST,
        data:
            SignupRequest(
              username: username,
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
            ).toJson(),
      );

      if (response.statusCode == 201) {
        print(response.data);
        emit(
          state.copyWith(
            isSignupSuccess: true,
            isLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isSignupSuccess: false,
            isLoading: false,
          ),
        );
      }
    } on DioException catch (e) {
      print(e.response);
      emit(
        state.copyWith(
          isSignupSuccess: false,
          isLoading: false,
          
        ),
      );
    }
  }

  // bool get isEnableButton =>
  //     state.emailError.isEmpty && state.passwordError.isEmpty && state.usernameError.isEmpty;

  // void signup(String username,String email, String password) async {
  //   emit(state.copyWith(isLoading: true)); 
  //   await Future.delayed(const Duration(seconds: 5)); 
  //   // Giả sử đăng nhập thành công
  //     emit(state.copyWith(isLoginSuccess: true, isLoading: false));
  // }
}