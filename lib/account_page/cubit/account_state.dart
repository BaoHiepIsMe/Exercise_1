
import 'package:login/account_page/model/user.dart';

class AccountState{
  final User user;

  AccountState({
    required this.user
  });
  AccountState copyWith({ User? user}){
    return AccountState(user: user ?? this.user);
  }
}
