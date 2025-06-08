
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/homepage/homepage.dart';
import 'package:login/homepage/homepage_cubit.dart';
import 'package:login/login_page/login_cubit_cubit.dart';
import 'package:login/loading/loadingscreen.dart';
import 'package:login/menu.dart';
import 'package:login/signup_page/signup.dart';
import 'package:login/signup_page/signup_cubit.dart';

class LoginPage extends StatefulWidget {
 //const MyWidget({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _showPW = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:BlocConsumer<LoginCubit,LoginState>( 
               listener: (context, state) {
          if (state.isLoginSuccess) {
             //  final homeCubit = HomeCubit()..loadProducts(); // tạo và gọi load 1 lần
             Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => TabBarDemo()),
            );
          };
          
        },
       builder: (context, state) {
   
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            constraints: const BoxConstraints.expand(),
            color: Colors.white,
            child: SingleChildScrollView( 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 80),
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("image/R.png"),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter your emails and password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 40),
                  //nhap email
                  TextField(
                    controller: _userController,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Nhập email của bạn",
                      errorText: state.emailError.isEmpty ? null : state.emailError,
                      labelStyle: const TextStyle(color: Color(0xff888888), fontSize: 20),
                    ),
                    onChanged: (value){
                    context.read<LoginCubit>().onchangeUsername(value); 
                    },
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        controller: _passController,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                        obscureText: !_showPW,
                        decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          errorText: state.passwordError.isEmpty ? null : state.passwordError,
                          labelStyle: const TextStyle(color: Color(0xff888888), fontSize: 20),
                        ),
                          onChanged: (value) {
                            context.read<LoginCubit>().onchangePassword(value);
                          },

                      ),
                      GestureDetector(
                        onTap: onToggleShowPass,
                        child: Icon(
                          _showPW ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 220),
                    child: Text("Forgot Password?"),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                       onPressed: _userController.text.isNotEmpty &&
                                  _passController.text.isNotEmpty &&
                                  state.passwordError.isEmpty && state.emailError.isEmpty
                            ? () {
                           final username = _userController.text;
                          final password = _passController.text;
                          context.read<LoginCubit>().login(username, password);
                              }
                            : null,
                      child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BlocProvider(
                            create: (_) => SignupCubit(),
                              child: Signup(),
                              ),
                            ),
                          );
                            },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  void onToggleShowPass(){
    setState(() {
      _showPW = !_showPW;
    });

  }
}  