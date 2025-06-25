part of 'signup_cubit.dart';

class SignUpState {
  final String usernameError;
  final String emailError;
  final String passwordError;
  final bool isLoading;
  final bool isSignupSuccess;

  const SignUpState({
    this.usernameError='',
    this.emailError = '',
    this.passwordError = '',
    this.isLoading = false,
    this.isSignupSuccess = false,
  });

  SignUpState copyWith({
    String? usernameError,
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isSignupSuccess,
  }) {
    return SignUpState(
      usernameError: usernameError ?? this.usernameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
      isSignupSuccess: isSignupSuccess ?? this.isSignupSuccess,
    );
  }
}
