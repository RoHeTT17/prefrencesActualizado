import 'package:flutter/material.dart';
import 'package:preferences_user_regrabado/providers/theme_provider.dart';
import 'package:preferences_user_regrabado/screens/screens.dart';
import 'package:preferences_user_regrabado/share_preferences/shared_preferences_global.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  //runApp(const MyApp());

  //Agregar provider global
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkmode: Preferences.getIsDarkMode)),
        ],
      child: const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName    : (BuildContext context) => const HomeScreen(),
        SettingScreen.routerName : (BuildContext context) => const SettingScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
