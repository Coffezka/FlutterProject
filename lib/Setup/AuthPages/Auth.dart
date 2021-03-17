import 'package:flutter/material.dart';
import 'package:flutter_auth/Setup/AuthPages/LogIn.dart';
import 'package:flutter_auth/Setup/AuthPages/SignUp.dart';

class Auth extends StatefulWidget{
  @override
  _AuthState createState() => _AuthState();
}
class _AuthState extends State<Auth>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/gym.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(  
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Enter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 45
                      ),
                  ),
                  SizedBox(height: 350),
                  MaterialButton(
                    onPressed: NavigateSignUp,
                    child: Text('SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        )
                    ),
                  ),
                  SizedBox(height: 50),
                  MaterialButton(
                    height: 60.0, 
                    minWidth: 300.0, 
                    onPressed: NavigateLogIn,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Text('LOG IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        )
                    ),
                  ),
                  ],
          )
        )
      ),
    );
  }

  Future<void> NavigateSignUp() async {
    Navigator.push(context,MaterialPageRoute(builder: (context)=> Register()));
  }

  Future<void> NavigateLogIn() async {
    Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage()));
  }

}