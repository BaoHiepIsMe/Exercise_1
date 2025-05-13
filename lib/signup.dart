import 'package:flutter/material.dart';
import 'package:login/main.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}
class _SignupState extends State<Signup> {
    bool _showPW = false;
    TextEditingController _nameController = new TextEditingController();
    TextEditingController _userController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();
  var _userNameError = "Tai khoan khong hop le";
  var _passError     = "Mat khau phai tren 6 ki tu";
  var _nameError     = "Ten khong hop le";
  var _userInvalid = false;
  var _passInvalid = false;
  var _nameInvalid = false;
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(  body: Container(
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
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffd8d8d8),
                    ),
                    child: FlutterLogo(
                    )
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
                      errorText: _nameInvalid ? _nameError : null,
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
                        onPressed: onSignInClick,
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
                          TextButton(onPressed: onLogInClick,
                           child: Text("SignIn",
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
      if(_nameController.text.length<6){
       _nameInvalid = true;
      }else{
        _nameInvalid = false;
      }
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
      if(!_userInvalid&&!_passInvalid&&!_nameInvalid){
Navigator.popUntil(context, (route) => route.isFirst);
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>gotoHome()));
      }
    });
  }

  void onLogInClick(){
Navigator.popUntil(context, (route) => route.isFirst);
  }
  
 
}