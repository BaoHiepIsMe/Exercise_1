part of 'signup_cubit.dart';

class SignUpState {
  final String usernameError;
  final String emailError;
  final String passwordError;
  final bool isLoading;
  final bool isLoginSuccess;

  const SignUpState({
    this.usernameError='',
    this.emailError = '',
    this.passwordError = '',
    this.isLoading = false,
    this.isLoginSuccess = false,
  });

  SignUpState copyWith({
    String? usernameError,
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isLoginSuccess,
  }) {
    return SignUpState(
      usernameError: usernameError ?? this.usernameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
