import 'dart:convert';

import 'package:login/account_page/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUser {
  static const String _userInfoKey = 'user_info';

   Future<void> saveUser(User userInfor) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userInfoKey, jsonEncode(userInfor.toJson()));
    print("SAVED USER: ${userInfor.toJson()}"); // log
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userInfoKey);

    if (userJson != null) {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      return User.fromJson(userMap);
    }
  }

  // Logout
  Future<bool> deleteUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_userInfoKey);
    } catch (e) {
      print(e);
      return false;
    }
  }
}