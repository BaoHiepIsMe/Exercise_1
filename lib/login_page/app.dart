import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:login/cubits/cubit/login_cubit_cubit.dart';
import 'package:login/login_page/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => LoginCubit(),
        child: LoginPage(),
      ),
    );
  }
}
