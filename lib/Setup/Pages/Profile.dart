import 'package:flutter/material.dart';
import 'package:flutter_auth/Setup/Pages/WidgetButtomNavBar.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile>{
  int _currentIndex = 3;

  @override 
  Widget build(BuildContext context){
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: NavBarWidget(colorScheme,_currentIndex,textTheme,context),
      appBar: AppBar(
      ),
      body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  
                  children: <Widget>[
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage("https://www.woolha.com/media/2020/03/eevee.png"),
                      ),
                    ListTile(
                      title: Text('Elon Musk',
                        style: TextStyle(
                              fontWeight: FontWeight.w900,
                          )
                      ),
                      subtitle: Text('Info'),
                    ),
                    ListTile(
                        title: Text('GymPoints',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                          )
                        ),
                        subtitle: Text('1500'),
                    ),
                    ListTile(
                        title: Text('Hours in the gym',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                          )   
                          ),
                        subtitle: Text('36'),
                    ),
                  ]
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('Attendance'),
                    ),
                    
                  ],
                ),
              ),
            ]
          ),
      ),
    );
  }
  
  ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
  }

}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;
const defaultLetterSpacing = 0.03;