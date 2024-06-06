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
        itemBuilder: (BuildContext context, int index) {
          print('noticias: ${noticias[index]}');
          return _Noticias(noticia: noticias[index], index: index);
          // return Text(noticias[index].title!, style: TextStyle(color: Colors.white),);
        });
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
        _TarjetaTopBar(noticia: noticia,index: index,),
        _TarjetaTitulo(noticia),
        _TarjetaImagen(noticia),
        _TarjetaBody(noticia),
        SizedBox(height: 10,),
        Divider(),
        _TarjetaBotones()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){}, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.white,
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: (){}, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.white,
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  const _TarjetaBody(this.noticia);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({super.key, required this.noticia, required this.index});

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
          Text(
            '${index + 1}',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            '${noticia.author}',
            style: TextStyle(color: Colors.white),
          )
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
      child: Text(
        noticia.title!,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen(this.noticia);
  final Article noticia;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage))
                : Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
    // if(noticia.urlToImage != null){
    //   return withImage();
    // }
    // return withoutImage();
    // return Container(
    //   child: FadeInImage(
    //     placeholder: const AssetImage('assets/img/giphy.gif'),
    //     image: noticia.urlToImage != null ? NetworkImage(noticia.urlToImage) : NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg')
    //   )
    // );
  }

  Widget withoutImage() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: const FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: AssetImage('assets/img/no-image.png')));
  }

  Widget withImage() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: FadeInImage(
            placeholder: const AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage)));
  }
}
