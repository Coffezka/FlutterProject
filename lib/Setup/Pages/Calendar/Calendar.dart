import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_auth/Setup/Pages/WidgetButtomNavBar.dart';

class Calendar extends StatefulWidget{
  @override
  _CalendarState createState() => _CalendarState();
}
class _CalendarState extends State<Calendar>{
  int _currentIndex = 1;

  @override 
  Widget build(BuildContext context){
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: NavBarWidget(colorScheme,_currentIndex,textTheme,context),
      body: Container(
        child: Center(
          child: SfCalendar(
            dataSource: _getCalendarDataSource(),
          ),
        )
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

class DataSource extends CalendarDataSource {
 DataSource(List<Appointment> source) {
   appointments = source;
 }
}

DataSource _getCalendarDataSource() {
   List<Appointment> appointments = <Appointment>[];
   appointments.add(Appointment(
     startTime: DateTime.now(),
     endTime: DateTime.now().add(Duration(hours: 2)),
     subject: 'Fitness',
     color: Colors.red,
     startTimeZone: '',
     endTimeZone: '',
   ));

  appointments.add(Appointment(
     startTime: DateTime.now().add(Duration(hours: 2)),
     endTime: DateTime.now().add(Duration(hours: 4)),
     subject: 'CrossFit',
     color: Colors.purple,
     startTimeZone: '',
     endTimeZone: '',
   ));
  
  appointments.add(Appointment(
     startTime: DateTime.now().add(Duration(days: 1)),
     endTime: DateTime.now().add(Duration(days: 1,hours: 4)),
     subject: 'Bicycle',
     color: Colors.green,
     startTimeZone: '',
     endTimeZone: '',
   ));

   return DataSource(appointments);
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