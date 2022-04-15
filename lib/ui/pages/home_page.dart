part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          SafeArea(
              child: Container(
                color: Colors.white,
              )),
          SafeArea(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.2,
                    right: -MediaQuery.of(context).size.width / 2.6,
                    top: -MediaQuery.of(context).size.width / 2,
                    child: Opacity(
                      opacity: 0.2,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/pokeball_gray.png')),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03,
                              bottom: MediaQuery.of(context).size.width * 0.03,
                            ),
                            child: const AutoSizeText(
                              "Pokedex",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        BlocBuilder<ResourcePokemonResultsBloc,
                            ResourcePokemonResultState>(
                          builder: (context, state) {
                            if (state is ResourcePokemonResultInitial) {
                              return Container(
                                margin: const EdgeInsets.only(top: 100),
                                child: const Center(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            } else {
                              ResourcePokemonResultLoaded
                              resourcePokemonResultLoaded =
                              state as ResourcePokemonResultLoaded;
                              if (resourcePokemonResultLoaded
                                  .listPokemon!.isEmpty) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  child: const Center(
                                    child: Text("Tidak ada pokemon."),
                                  ),
                                );
                              } else {
                                return GridView.builder(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: (1 / .8),
                                    ),
                                    itemCount: (resourcePokemonResultLoaded
                                        .listPokemon!
                                        .isNotEmpty)
                                        ? resourcePokemonResultLoaded
                                        .listPokemon!.length
                                        : 0,
                                    itemBuilder: (context, index) => PokemonCardWidget(
                                      pokemonModel:
                                      resourcePokemonResultLoaded
                                          .listPokemon![
                                      index],
                                    ));
                              }
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

