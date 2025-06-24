import 'package:dio/dio.dart';
import 'package:login/account_page/model/user.dart';
import 'package:login/start_main/linkCallApi.dart';
import 'package:login/storage/storage.dart';
import 'package:login/storage/user_storage.dart';

import 'account_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountState(user: User()));

  final Dio dio = Dio();
  Future<void> getUser() async{
    try{
      final storage = Storage();
      final token = await storage.getToken();
      print("TOKEN: $token");
      if(token != null){
        final response =await dio.get(
          GET_ACCOUNT,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );
        if (response.statusCode == 200) {
          print("Load ok");
          print(response.data);
          // Save inforUser => Storage
          User userResponse = User.fromJson(response.data['data']['userInfo']);
          final storageUser = StorageUser();
          await storageUser.saveUser(userResponse);
        }
      }
    }catch(e){
      print(e);
    }
  }
   void loadUser() async {
        try {
          final storageUser = StorageUser();
          User? userOK = await storageUser.getUser();
          print("LOADED USER: ${userOK?.toJson()}");
          if (userOK != null) {
            emit(state.copyWith(user: userOK));
          }
        } catch (e) {
          print(e);
        }
      }

   Future<bool?> deleteAccount() async {
    try {
        final storage = Storage();
        final token = await storage.getToken();      
        if (token != null) {
        final response = await dio.delete(
          DELETE_ACCOUNT,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        if (response.statusCode == 200) {
          print("Da xoa");
          return true;
        } else {
          print("loi khi xoa");
          return false;
        }
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
    }
    Future<void> logOut() async {
        try {
          final storage = Storage();
          await storage.clearTokens();
          print("Đã đăng xuất");
        } catch (e) {
          print("Lỗi khi đăng xuất: $e");
        }
  }

  }

