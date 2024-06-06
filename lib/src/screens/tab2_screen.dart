import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/app_theme.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tabs2Screen extends StatelessWidget {

  const Tabs2Screen({super.key});
  
  @override
  Widget build(BuildContext context){

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const _ListaCategorias(),

            if ( !newsService.isLoading )   
              Expanded(
                child: ListaNoticias(noticias: newsService.getArticulosCategoriasSeleccionadas)
              ),
            if ( newsService.isLoading ) 
              const Expanded(
                child: Center(child: CircularProgressIndicator())
              )
          ],
        )
      ),
    );
  }


}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias();

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 85,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
      
          final categoryName = categories[index].name;
      
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _CategoryButton(category: categories[index],),
                const SizedBox(height: 5,),
                Text('${categoryName[0].toUpperCase()}${categoryName.substring(1)}', style: const TextStyle(color: Colors.white))
                // Text(categories[index].name,style: const TextStyle(color: Colors.white))
              ],
            ),
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context); // Aqui si se ocupa el listen en false porque se va a ocupar cuando se haga algún cambio

    return GestureDetector(
      onTap: (){
        // print(category.name);
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon, 
          color: ( newsService.selectedCategory == category.name )
                  ? darkTheme.primaryColor
                  : Colors.black54
        )
      ),
    );
  }
}
