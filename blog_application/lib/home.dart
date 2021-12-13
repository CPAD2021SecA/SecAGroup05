import 'package:blog_application/blogDashboard.dart';
import 'package:blog_application/createPost.dart';
import 'package:blog_application/profilePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  _onTap() { // this has changed
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => _pageOptions[selectedPage])); // this has changed
  }

  final _pageOptions = [
    BlogDashboardWidget(),
    CreatePostWidget(),
    ProfilePageWidget()
  ];

  @override
  Widget build(BuildContext context) {
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

    TextTheme _buildShrineTextTheme(TextTheme base) {
      return base
          .copyWith(
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
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
    ThemeData _buildShrineTheme() {
      final ThemeData base = ThemeData.light();
      return base.copyWith(
        colorScheme: _shrineColorScheme,
        textTheme: _buildShrineTextTheme(base.textTheme),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions.elementAt(selectedPage),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.add, size: 30), title: Text('Add Post')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 30), title: Text('Profile')),
          ],
          elevation: 5.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: _shrineColorScheme.surface,
          selectedItemColor: _shrineColorScheme.onSurface,
          unselectedItemColor: _shrineColorScheme.onSurface.withOpacity(.60),
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
            _onTap();
          },
        )
    );
  }
}

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