import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/views/feed_view.dart';
import 'package:unifit/views/profile_view.dart';
import 'package:unifit/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  /// Application's home page.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomNavBarIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _mainViewOptions = <Widget>[
    FeedView(),
    Text(
      AppStrings.CALENDAR,
      style: optionStyle,
    ),
    Text(
      AppStrings.TITLE,
      style: optionStyle,
    ),
    Text(
      AppStrings.ACHIEVEMENTS,
      style: optionStyle,
    ),
    ProfileView(),
  ];

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedBottomNavBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double homeAppBarHeight = MediaQuery.of(context).size.height / 14;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(homeAppBarHeight),
        child: const HomeAppBar(),
      ),
      body: Center(
        child: _mainViewOptions.elementAt(_selectedBottomNavBarIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.MAIN_BLUE,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.HOME,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: AppStrings.CALENDAR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: AppStrings.EMPTY,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: AppStrings.ACHIEVEMENTS,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.PROFILE,
          ),
        ],
        currentIndex: _selectedBottomNavBarIndex,
        selectedItemColor: AppColors.MAIN_ORANGE,
        unselectedItemColor: Colors.white,
        onTap: _onBottomNavBarItemTapped,
      ),
    );
  }
}
