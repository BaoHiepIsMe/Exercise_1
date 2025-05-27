part of 'login_cubit_cubit.dart';

class LoginState {
  final String emailError;
  final String passwordError;
  final bool isLoading;
  final bool isLoginSuccess;

  const LoginState({
    this.emailError = '',
    this.passwordError = '',
    this.isLoading = false,
    this.isLoginSuccess = false,
  });

  LoginState copyWith({
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isLoginSuccess,
  }) {
    return LoginState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
