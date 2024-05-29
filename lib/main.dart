import 'package:flutter/material.dart';
import 'package:news_app/src/screens/screens.dart';
import 'package:news_app/src/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'TabsScreen',
      routes: {
        'TabsScreen' : (_) => TabsScreen(),
      },
      theme: darkTheme,
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hola mundo')
      //   ),
      // ),
    );
  }
}
