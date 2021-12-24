import 'package:flutter/material.dart';
import 'package:preferences_user_regrabado/share_preferences/shared_preferences_global.dart';
import 'package:preferences_user_regrabado/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${Preferences.getIsDarkMode}'),
          const Divider(),
          Text('Género: ' + Preferences.getGender.toString()),
          const Divider(),
          Text('Nombre de usuario: ' + Preferences.getName),
          Divider(),
        ],
      )
    );
  }
}
