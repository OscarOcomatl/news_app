import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_model.dart';
// import 'package:news_app/src/theme/app_theme.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({super.key, required this.noticias});

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          // print('noticias: ${noticias[index]}');
          return _Noticias(noticia: noticias[index], index: index);
          // return Text(noticias[index].title!, style: TextStyle(color: Colors.white),);
        });
  }
}

class _Noticias extends StatelessWidget {
  const _Noticias({required this.noticia, required this.index});

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
        const SizedBox(height: 10,),
        const Divider(),
        const _TarjetaBotones()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){}, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.white,
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: (){}, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.white,
            child: const Icon(Icons.more),
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({required this.noticia, required this.index});

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    // print('noticia: ${noticia.source}');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: const TextStyle(color: Colors.red),
          ),
          Text(
            '${noticia.author}',
            style: const TextStyle(color: Colors.white),
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
      margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage))
                : imageNotAvailable()
        ),
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

  Widget imageNotAvailable(){
    return const Image(
      image: AssetImage('assets/img/no-image.png')
    );
  }

  Widget withoutImage() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: AssetImage('assets/img/no-image.png')));
  }

  Widget withImage() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FadeInImage(
            placeholder: const AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage)));
  }
}
