import 'package:flutter/material.dart';
import 'package:flutter_auth/Setup/AuthPages/Auth.dart';

class StartPage extends StatefulWidget{
  @override
  _StartState createState() => new _StartState();
}
class _StartState extends State<StartPage>{
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
        child: Center ( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  Text(
                    "Welcome to the Fitness",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 45
                    ),
                  ),
                  SizedBox(height: 350),
                  MaterialButton(
                    height: 60.0, 
                    minWidth: 300.0, 
                    onPressed: start,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Text('START',
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

  Future<void> start() async {
    Navigator.push(context,MaterialPageRoute(builder: (context)=> Auth()));
  }
  
}