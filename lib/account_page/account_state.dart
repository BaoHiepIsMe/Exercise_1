import 'package:flutter/material.dart';

class DetailAccount{
  final String avata;
  final String gmail;
  final String name;

  DetailAccount({
    required this.avata,
    required this.gmail,
    required this.name
  });
}

abstract class AccountState {}

class UserInitial extends AccountState{}

class UserLoaded extends AccountState {
  final DetailAccount user;

  UserLoaded(this.user);
}
