import 'package:flutter/material.dart';
import 'package:flutter_auth/Setup/AuthPages/LogIn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        ),
        body: Container(
          child: Form(
          key: _formKey,
          child: 
            Center( 
              child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Registration',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34
                   ),
                ),
                Column( 
                  children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if(input.isEmpty){
                      return 'Provide an email';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (input) => _email = input,
                ),
                SizedBox(height:10),
                TextFormField(
                  validator: (input) {
                    if(input.length < 6){
                      return 'Longer password please';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                ]
                ),
                MaterialButton(
                    height: 60.0, 
                    minWidth: 300.0, 
                    onPressed: register,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Text('SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        )
                    ),
                  ),
              ],
            ),
         )
        )
      )
    );
  }
  Future<void> register() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
          UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password
        );
        Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage()));
      }
      catch(e){
        print(e.message);
      }
    }
  }
}