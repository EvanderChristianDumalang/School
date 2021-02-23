import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/pokemondetail.dart';
import 'package:pokedex/services/pokeApi.dart';
import 'package:pokedex/util.dart';

final mViewModel = PokedexViewModel();

void main() {
  mViewModel.getAll(() => [runApp(MyApp())]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pokedex',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: MyHomePage(title: 'Flutter Pokedex'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.cyan,
      ),
      body: GridView.count(
              crossAxisCount: 2,
              children: mViewModel.pokemons.map((pokemon)  => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) {
                              
                                      var pokeDetail = PokeDetail(
                                          pokemon: pokemon,
                                        );
                                      return pokeDetail;
                                    }));
                          },
                          child: Hero(
                            tag: pokemon.image,
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    width:150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: NetworkImage(pokemon.image))),
                                  ),
                                  Text(
                                    capitalizeFirstCharacter(pokemon.name.toString()),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          showSearch(context: context, delegate: PokemonSearch());
          },
            backgroundColor: Colors.cyan,
            child: Icon(Icons.search),
        ),
      );
    }
  }
  

class PokemonSearch extends SearchDelegate<String> {
  final Pokemon pokemon;
  

  PokemonSearch({this.pokemon});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
    
  @override
  Widget buildResults(BuildContext context) {
    return null;
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty?  mViewModel.pokemons 
    : mViewModel.pokemons.where((element) =>  (element.name).startsWith(RegExp(query, caseSensitive: false))).toList();
     
    return mylist.isEmpty? Text("No Pokemon Found") : ListView.builder(
      itemCount: mylist.length,
      itemBuilder: (context, index){
        final Pokemon pokelist = mylist[index];
        return InkWell( onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>PokeDetail(pokemon:pokelist)));
        },
        child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(capitalizeFirstCharacter(pokelist.name), style: TextStyle(fontSize: 20),),
              ] 
            )
          ) 
        );
      }
    );
  }
}
