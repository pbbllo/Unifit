import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/views/home_view.dart';
import 'package:unifit/widgets/home_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedBottomNavBarIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _mainViewOptions = <Widget>[
    HomeView(),
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
    Text(
      AppStrings.PROFILE,
      style: optionStyle,
    ),
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
