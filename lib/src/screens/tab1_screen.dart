import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

                          // Para mantener el estado de donde se dejó la app
                          // Se tiene que convertir en stateful widget
class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

                                                  // Se hereda de esta clase
class _Tab1ScreenState extends State<Tab1Screen>  with AutomaticKeepAliveClientMixin{
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    // newsService.headlines;

    return Scaffold(

      body: ( headlines.isEmpty )
            ? const Center(child: CircularProgressIndicator())
            : ListaNoticias(noticias: headlines)

    );
  }
  
  // Y se sobre escribe el metodo
  @override
  bool get wantKeepAlive => true; // Siempre se quiere mantener el estado
}