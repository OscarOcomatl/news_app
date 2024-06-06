import 'dart:convert';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:news_app/src/models/category_model.dart';

class NewsResponse {
    String? status;
    int? totalResults;
    List<Article>? articles;
          

    NewsResponse({
        this.status,
        this.totalResults,
        this.articles,
    });

    factory NewsResponse.fromJson(String str) => NewsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NewsResponse.fromMap(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toMap())),
    };
}

class Article {
    Source? source;
    String? author;
    String? title;
    dynamic description;
    String? url;
    dynamic urlToImage;
    DateTime? publishedAt;
    dynamic content;

    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Article.fromMap(Map<String, dynamic> json) => Article(
        source: Source.fromMap(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toMap() => {
        "source": source!.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
    };
}

class Source {
    Id? id;
    Name? name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]]!,
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toMap() => {
        "id": idValues.reverse[id],
        "name": nameValues.reverse[name],
    };
}

enum Id {
    GOOGLE_NEWS
}

final idValues = EnumValues({
    "google-news": Id.GOOGLE_NEWS
});

enum Name {
    GOOGLE_NEWS
}

final nameValues = EnumValues({
    "Google News": Name.GOOGLE_NEWS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}