import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_model.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2/';
final _API_KEY = '3521eab6194c4673b578e2d62219d1bf';


class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  String _selectedCategory = 'business';

  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String,List<Article>> categoryArticles = {};

  NewsService(){
    getTopHeadLines();
    categories.forEach((item) { 
      categoryArticles[item.name] = List.empty(growable: true);
    });
    getArticlesByCategory(_selectedCategory);
  }

  bool get isLoading => _isLoading;

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor){
    _selectedCategory = valor;
    _isLoading = true;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  get getArticulosCategoriasSeleccionadas => categoryArticles[selectedCategory];

  getTopHeadLines()async {
    final url = '${_URL_NEWS}top-headlines?country=mx&apiKey=${_API_KEY}';
    final response = await http.get(Uri.parse(url));
    final newsResponse =  NewsResponse.fromJson(response.body);
    headlines.addAll(newsResponse.articles!);
    notifyListeners();
  }

  getArticlesByCategory( String category ) async {
    if( categoryArticles[category]!.isNotEmpty ){
      return categoryArticles[category]!;
    }
    final url = '${_URL_NEWS}top-headlines?country=mx&apiKey=$_API_KEY&category=$category';
    final response = await http.get(Uri.parse(url));
    final newsResponse =  NewsResponse.fromJson(response.body);
    categoryArticles[category]!.addAll(newsResponse.articles!);
    _isLoading = false;
    notifyListeners();
  }


}