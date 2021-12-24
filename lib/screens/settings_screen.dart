import 'package:flutter/material.dart';
import 'package:preferences_user_regrabado/providers/theme_provider.dart';
import 'package:preferences_user_regrabado/share_preferences/shared_preferences_global.dart';
import 'package:preferences_user_regrabado/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {

  static const String routerName = 'settings';

  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

/*  bool isDarkmode = false;
  int gender = 1;
  String nameUser = 'Don Roger';*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ajustes',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),),
            const Divider(),

            SwitchListTile.adaptive(
                value: Preferences.getIsDarkMode, //isDarkmode,
                title: const Text('Darkmode'),
                onChanged: (value){

                  setState(() {
                    Preferences.setIsDarkMode = value;

                    final themeProvider = Provider.of<ThemeProvider>(context,listen: false);

                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLightMode();

                  });

                }
            ),
            const Divider(),
            RadioListTile<int>(
                value: 1,
                groupValue: Preferences.getGender,
                title: const Text('Masculino'),
                onChanged: (value){

                  setState(() {
                    //gender = value ?? 1;
                    Preferences.setGender = value ?? 1;
                  });

                }
            ),
            const Divider(),
            RadioListTile<int>(
                value: 2,
                groupValue:  Preferences.getGender,//gender,
                title: const Text('Femenino'),
                onChanged: (value){
                  setState(() {
                    //gender = value ?? 2;
                    Preferences.setGender = value ?? 2;
                  });
                }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.getName,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario'
                ),
                onChanged: (nameValue){
                  setState(() {
                    //nameUser = nameValue;
                    Preferences.setName = nameValue;
                  });
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
