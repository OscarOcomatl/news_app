import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/app_theme.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({super.key, required this.noticias});

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index ){
        print('noticias: ${noticias[index]}');
        return _Noticias(noticia: noticias[index], index: index);
        // return Text(noticias[index].title!, style: TextStyle(color: Colors.white),);
      }
    );
  }
}

class _Noticias extends StatelessWidget {
  const _Noticias({super.key, required this.noticia, required this.index});

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia, index: index,),
        _TarjetaTitulo(noticia),
        _TarjetaImagen(noticia)
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({
    super.key, required this.noticia, required this.index
  });

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    print('noticia: ${noticia.source}');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}', style: TextStyle(color: Colors.red),),
          Text('${noticia.author}', style: TextStyle(color: Colors.white),)
        
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo(this.noticia);
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen(this.noticia);
  final Article noticia;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeInImage(
        placeholder: const AssetImage('assets/img/giphy.gif'), 
        image: noticia.urlToImage != null ? NetworkImage(noticia.urlToImage) : NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg')
      )
    );
  }
}