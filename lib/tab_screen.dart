import 'package:flutter/material.dart';
import 'package:flutter_application_1/Categories_screen.dart';
import 'package:flutter_application_1/favorites_screen.dart';
import 'package:flutter_application_1/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _page = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];
  final List<String> _Namepage = ['Categories', 'Favorites'];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_Namepage[_selectedPageIndex]),
        ),
        body: _page[_selectedPageIndex],
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Favorites'))
          ],
        ),
      ),
    );
  }
}
