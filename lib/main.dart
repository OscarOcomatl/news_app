import 'package:flutter/material.dart';
import 'package:news_app/src/screens/screens.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => NewsService() )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
