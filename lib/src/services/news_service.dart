import 'package:flutter/material.dart';
import 'package:news_app/src/models/new_models.dart';



class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  
  NewsService(){
    getTopHeadLines();
  }

  getTopHeadLines(){
    final url = 'https://newsapi.org/v2/top-headlines?country=mx&apiKey=3521eab6194c4673b578e2d62219d1bf';
  }


}