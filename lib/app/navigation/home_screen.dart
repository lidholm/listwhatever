import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/firebase/firebase_auth_provider.dart';
import 'package:listanything/app/pages/about/about_page.dart';
import 'package:listanything/app/pages/counter/counter_page.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    return AsyncValueWidget<FirebaseAuth>(
      value: ref.watch(firebaseAuthProvider),
      data: (auth) {
        final _widgetOptions = <Widget>[
          const CounterPage(),
          ProfileScreen(auth: auth),
          const AboutPage(),
        ];

        return Scaffold(
          appBar: AppBar(
            title: const Text('BottomNavigationBar Sample'),
          ),
          body: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.plus_one),
                label: 'Counter',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              ref.read(selectedIndexProvider.notifier).state = index;
            },
          ),
        );
      },
    );
  }
}
