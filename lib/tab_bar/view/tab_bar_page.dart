import 'package:flutter/material.dart';
import 'package:listwhatever/l10n/l10n.dart';
import 'package:listwhatever/pages/about/about_page.dart';
import 'package:listwhatever/pages/counter/view/counter_page.dart';
import 'package:listwhatever/pages/firestore/view/pet_page.dart';
import 'package:listwhatever/tab_bar/models/tabpage.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() {
    return TabBarPageState();
  }
}

class TabBarPageState extends State<TabBarPage> {
  int _selectedIndex = 0;

  final pages = [
    TabPage(
      key: 'counter',
      label: (context) => context.l10n.counterTabTitle,
      icon: Icons.home,
      page: const CounterPage(),
    ),
    
    TabPage(
      key: 'pets',
      label: (context) => context.l10n.petTabTitle,
      icon: Icons.pets,
      page: const PetPage(),
    ),
    
    TabPage(
      key: 'about',
      label: (context) => context.l10n.aboutTabTitle,
      icon: Icons.question_mark,
      page: const AboutPage(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getSelectedPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: pages
            .map(
              (page) => BottomNavigationBarItem(
                key: Key(page.key),
                icon: Icon(page.icon),
                label: page.label(context),
              ),
            )
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    return pages[index].page;
  }
}
