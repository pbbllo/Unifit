import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/views/event_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double navBarHeight = MediaQuery.of(context).size.height / 14;
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Container(
      color: AppColors.MAIN_BLUE.withOpacity(0.1),
      child: Column(children: [
        NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _selectedNavBarIndex = index;
            });
          },
          height: navBarHeight,
          selectedIndex: _selectedNavBarIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.event),
              label: AppStrings.EVENTS,
            ),
            NavigationDestination(
              icon: Icon(Icons.feed),
              label: AppStrings.POSTS,
            ),
          ],
        ),
        <Widget>[
          EventListView(),
          const Text('Publicações', style: optionStyle)
        ][_selectedNavBarIndex]
      ]),
    );
  }
}
