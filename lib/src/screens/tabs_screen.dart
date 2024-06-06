
import 'package:flutter/material.dart';
import 'package:news_app/src/screens/screens.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {

  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: const Scaffold(
        
          body: _Screens(),
          bottomNavigationBar: _Navigation(),
      ),
    );
  }

}

class _Navigation extends StatelessWidget {
  const _Navigation();

  @override
  Widget build(BuildContext context) {
    
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: ( index ) => navigationModel.currentPage = index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public),label: 'Encabezados'),
      ]
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens();

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      // scrollDirection: Axis.vertical, // cambiar la direccion de scroll del PageView
      // physics: const BouncingScrollPhysics(),  // Animacion para indicar que no hay mas info para hacer scroll
      physics: const NeverScrollableScrollPhysics(), // Bloquea la interaccion del scroll, se realiza para hacer la transicion con el bottomNavigationBar
      children: const [
        Tab1Screen(),
        Tabs2Screen()
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  
  set currentPage(int value){
    _currentPage = value;
    _pageController.animateToPage(value, duration: const Duration(microseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}