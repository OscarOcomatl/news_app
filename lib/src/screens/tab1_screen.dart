import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    // newsService.headlines;

    return Scaffold(

      body: ListaNoticias(noticias: headlines!)

    );
  }
}