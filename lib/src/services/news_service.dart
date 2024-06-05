import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2/';
final _API_KEY = '3521eab6194c4673b578e2d62219d1bf';


class NewsService with ChangeNotifier {
  List<Article>? headlines = [];


  
  NewsService(){
    getTopHeadLines();
  }

  getTopHeadLines()async {
    final url = '${_URL_NEWS}top-headlines?country=mx&apiKey=${_API_KEY}';
    final response = await http.get(Uri.parse(url));
    final newsResponse =  NewsResponse.fromJson(response.body);

    headlines!.addAll(newsResponse.articles!);
    notifyListeners();
  }


}