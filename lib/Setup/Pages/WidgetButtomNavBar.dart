import 'package:flutter/material.dart';
import 'package:flutter_auth/Setup/Pages/Calendar/Calendar.dart';
import 'package:flutter_auth/Setup/Pages/Home.dart';
import 'package:flutter_auth/Setup/Pages/Profile.dart';

Widget NavBarWidget(ColorScheme colorScheme, int _currentIndex, TextTheme textTheme, context){
  
  return  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap:  (int index) {
            switch (index) {
              case 0:
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Home()));
                break;
              case 1:
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Calendar()));
                break;
              case 2:
                
                break;
              case 3:
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Profile()));
                break;
            }
          }
          ,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Calendar'),
              icon: Icon(Icons.calendar_view_day),
            ),
            BottomNavigationBarItem(
              title: Text('Store'),
              icon: Icon(Icons.store),
            ),
            BottomNavigationBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        );
}