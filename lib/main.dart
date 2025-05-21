import 'package:flutter/material.dart';
import 'package:login/detail.dart';
import 'package:login/signup.dart';
import 'package:login/menu.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
 //const MyWidget({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _showPW = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameError = "Tai khoan khong hop le";
  var _passError     = "Mat khau phai tren 6 ki tu";
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //     image: DecorationImage(
                  
            //       image: AssetImage('image/hinh-anh-qua-tao.png'), // <-- đường dẫn ảnh
            //       fit: BoxFit.cover, // Phủ toàn bộ màn hình
            //     ),
            //   ),
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
                  child: Text("Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),),
                ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(0,0,0,60),
                  child: Text("Enter your emails and password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 15,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextField(
                    controller: _userController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText: _userInvalid ? _userNameError : null,
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
                          errorText: _passInvalid ? _passError : null ,
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
                  Padding(
                    
                    padding: const EdgeInsets.fromLTRB(220, 0, 0, 40),
                    child: Text("Forgot Password?"),
                  ),

                  
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(     
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                     ),
                      onPressed: onSignInClick,
                       child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ) ,
                   SizedBox(
                      width: double.infinity,
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?",
                          style: TextStyle(fontSize: 15,color: Colors.black,
                           ),
                          ),
                          TextButton(onPressed: gotoLogin,
                           child: Text("Sign up",
                           style: TextStyle(color: Colors.green),))
                        ],
                      ),
                    ),
            ],
          ),
        ),
      );
  }
  void onToggleShowPass(){
    setState(() {
      _showPW = !_showPW;
    });
  }
  void onSignInClick(){
    setState(() {
      if(_userController.text.length < 6 || !_userController.text.contains("@")){
        _userInvalid = true;
      }else {
        _userInvalid = false;
      }
      if(_passController.text.length < 6){
        _passInvalid = true;
      } else{
        _passInvalid = false;
      }
      if(!_userInvalid&&!_passInvalid){
        Navigator.push(context, MaterialPageRoute(builder: gotoHome ));
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>gotoHome()));
      }
    });
  }
    Widget gotoHome(BuildContext){
      return TabBarDemo();
    }
    Widget gotoSignUp(BuildContext){
      return Signup();
    }
    void gotoLogin(){
      Navigator.push(context,MaterialPageRoute(builder:gotoSignUp));
    }
}  