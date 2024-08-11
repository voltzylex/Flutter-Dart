import 'package:flutter/material.dart';
import 'package:plant_shop_ui/app/features/home/pages/home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  late List<Widget> pages;
  ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      navBarIcons(Icons.favorite),
      navBarIcons(Icons.notifications),
      navBarIcons(Icons.person),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, v, _) {
            return pages[_currentIndex.value];
          }),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _currentIndex.value = value,
          currentIndex: _currentIndex.value,
          iconSize: 35,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black45,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
    );
  }

  Widget navBarIcons(IconData icon) {
    return Center(
      child: Icon(
        icon,
        size: 100,
        color: Colors.green,
      ),
    );
  }
}
