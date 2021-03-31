import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Setup/Pages/Home.dart';
class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}
class _LoginPageState extends State <LoginPage>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      ),
      body: Form(
        key: _formKey,
        child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('LOG IN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34
                   ),
              ),
              Column( children: <Widget>[
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
              SizedBox(height: 10),
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
                    onPressed: signIn,
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
          ),
        )
      )
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
         UserCredential user = await  FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         Navigator.push(context,MaterialPageRoute(builder: (context)=> Home()));
      }
      catch(e){
        print(e.message);
      }
    }
  }

}