import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({super.key, required this.noticias});

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index ){
        return Text(noticias[index].title!, style: TextStyle(color: Colors.white),);
      }
    );
  }
}