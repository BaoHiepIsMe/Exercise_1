import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/loading/loadingscreen.dart';
import 'package:login/signup_page/signup_cubit.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}
class _SignupState extends State<Signup> {
    bool _showPW = false;
    TextEditingController _usernameController = new TextEditingController();
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();
    TextEditingController _firstNameController = new TextEditingController();
    TextEditingController _lastNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(  
      body: BlocConsumer<SignupCubit,SignUpState>(
        listener: (context, state) {
          if (state.isSignupSuccess) {
            Navigator.pushReplacementNamed(context, '/login');

          };
        },
        builder: (context, state) {
          if(state.isLoading){
            return LoadingScreen();
          }
          return SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Container(
                alignment: Alignment.center,
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
                 padding: const EdgeInsets.fromLTRB(0,0,0,10),
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
                    controller: _usernameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "UserName",
                      errorText: state.usernameError.isEmpty ? null : state.usernameError,
                      labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
                    ),
                     onChanged: (value){
                    context.read<SignupCubit>().onchangeUsername(value); 
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: _firstNameController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "First Name",
                              errorText: state.usernameError.isEmpty ? null : state.usernameError,
                              labelStyle: TextStyle(color: Color(0xff888888), fontSize: 20),
                            ),
                            onChanged: (value) {
                              context.read<SignupCubit>().onchangeUsername(value);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: _lastNameController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Last Name",
                              errorText: state.usernameError.isEmpty ? null : state.usernameError,
                              labelStyle: TextStyle(color: Color(0xff888888), fontSize: 20),
                            ),
                            onChanged: (value) {
                              context.read<SignupCubit>().onchangeUsername(value);
                            },
                          ),
                        ),
                      ),
                    ],
                  )

                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText:state.emailError.isEmpty ? null : state.emailError,
                      labelStyle: TextStyle(color: Color(0xff888888),fontSize: 20)
                    ),
                     onChanged: (value){
                    context.read<SignupCubit>().onchangeEmmail(value); 
                    },
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
                         onChanged: (value){
                          context.read<SignupCubit>().onchangePassword(value); 
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
                                  && _usernameController.text.isNotEmpty
                                  && _emailController.text.isNotEmpty
                                  && _passController.text.isNotEmpty
                                  && _lastNameController.text.isNotEmpty
                                  && _firstNameController.text.isNotEmpty
                            ? () {
                          final username = _usernameController.text.trim();
                          final email = _emailController.text.trim();
                          final password = _passController.text.trim();
                          final firstName = _firstNameController.text.trim();
                          final lastName = _lastNameController.text.trim();
                          context.read<SignupCubit>().signup(username,firstName,lastName,email, password);
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
                            Navigator.pushReplacementNamed(context, '/login');

                          },
                           child: Text("Sign In",
                           style: TextStyle(color: Colors.green),))
                        ],
                      ),
                    ),
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