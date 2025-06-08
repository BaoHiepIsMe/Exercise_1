import 'account_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<AccountState> {
  UserCubit() : super(UserInitial());

  void loadUser() {
    // Dữ liệu giả - bạn có thể thay bằng API hoặc localStorage
    final user = DetailAccount(
      name: "Nguyễn Văn A",
      gmail: "nguyenvana@example.com",
      avata: "image/dau.png",
    );
    emit(UserLoaded(user));
  }

  void logout() {
    emit(UserInitial());
  }
}
