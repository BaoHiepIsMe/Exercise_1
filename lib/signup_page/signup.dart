import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/loading/loadingscreen.dart';
import 'package:login/login_page/login_cubit_cubit.dart';
import 'package:login/login_page/login_page.dart';
import 'package:login/signup_page/signup_cubit.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}
class _SignupState extends State<Signup> {
    bool _showPW = false;
    TextEditingController _nameController = new TextEditingController();
    TextEditingController _userController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(  
      body: BlocConsumer<SignupCubit,SignUpState>(
        listener: (context, state) {
          if (state.isLoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            );
          };
        },
        builder: (context, state) {
          if(state.isLoading){
            return LoadingScreen();
          }
          return Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Container(
                    width: 150,
                    height: 150,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Color(0xffd8d8d8),
                    ),
                    child: Image.asset("image/R.png",),
                    ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,10),
                  child: Text("Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),),
                ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(0,0,0,60),
                  child: Text("Enter your credential to contunie",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 15,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "UserName",
                      errorText: state.usernameError.isEmpty ? null : state.usernameError,
                      labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextField(
                    controller: _userController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText:state.emailError.isEmpty ? null : state.emailError,
                      labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children:<Widget>[
                        TextField(
                          controller: _passController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        obscureText: !_showPW,
                        decoration: InputDecoration(
                          errorText: state.passwordError.isEmpty ? null : state.passwordError ,
                          labelText: "Password",
                          labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
                        ),
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
                    
                  ),
                  Container(
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      children: [
                        TextSpan(text: "By continuing you agree to our "),
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(color: Colors.green),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy.",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),


                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(     
                       style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                       ),
                        onPressed: state.passwordError.isEmpty 
                                  && state.emailError.isEmpty 
                                  && state.usernameError.isEmpty
                                  && _nameController.text.isNotEmpty
                                  && _userController.text.isNotEmpty
                                  && _passController.text.isNotEmpty
                            ? () {
                          final username = _userController.text;
                          final password = _passController.text;
                          final email = _nameController.text;
                          context.read<SignupCubit>().signup(username,email, password);
                              } : null,
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ) ,
                   SizedBox(
                      width: double.infinity,
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?",
                          style: TextStyle(fontSize: 15,color: Colors.black,
                           ),
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: 
                              (context)=>BlocProvider(create: (_)=>LoginCubit(),
                              child: LoginPage(),))
                            );
                          },
                           child: Text("Sign In",
                           style: TextStyle(color: Colors.green),))
                        ],
                      ),
                    ),
            ],
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