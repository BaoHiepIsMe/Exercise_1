import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:login/login_page/data/loginrequest.dart';
import 'package:login/login_page/data/loginresponse.dart';
import 'package:login/start_main/linkCallApi.dart';
import 'package:login/storage/storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final Dio dio = Dio();
  bool verifyPassword(String password){
    RegExp passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegExp.hasMatch(password);
  }

  bool verifyUsername(String email) {
    RegExp emailRegExp = RegExp(r'^.{2,}@.+');
    return emailRegExp.hasMatch(email);
  }

  void onchangeUsername(String email) {
    if (!verifyUsername(email)) {
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
   
  Future<void> login(String email,String password) async{
    emit(state.copyWith(isLoading: true));
     try {
        final response = await dio.post(
      LOGIN_POST,
      data: LoginRequest(email: email, password: password).toJson(),
      );
        if (response.statusCode == 200) {
          print("==> Đăng nhập thành công");
          LoginResponse loginResponse = LoginResponse.fromJson(response.data);
          final storage = Storage();
          await storage.saveTokens(loginResponse.accessToken, loginResponse.refreshToken);
          emit(state.copyWith(isLoading: false, isLoginSuccess: true));
        } else {
          print("==> Đăng nhập thất bại: statusCode != 200");
          emit(state.copyWith(isLoading: false, isLoginSuccess: false));
        }
      } catch (e) {
        print("==> Exception xảy ra: $e");
        emit(state.copyWith(isLoading: false, isLoginSuccess: false));
      }

    }
}
//   bool get isEnableButton =>
//       state.emailError.isEmpty && state.passwordError.isEmpty;

//   void login(String username, String password) async {
//    emit(state.copyWith(isLoading: true));  
//     // Giả sử đăng nhập thành công
//       emit(state.copyWith(isLoginSuccess: true, isLoading: false));
//   }
// }