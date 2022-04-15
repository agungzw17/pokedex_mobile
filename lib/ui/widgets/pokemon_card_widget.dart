part of 'widgets.dart';

class PokemonCardWidget extends StatelessWidget {
  PokemonModel? pokemonModel;

  PokemonCardWidget({Key? key, this.pokemonModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(pokemonModel!.sprites['front_default'].toString());
    return Container(
      height: 100,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.width * 0.03,
      ),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.05,
            bottom: -MediaQuery.of(context).size.width * 0.04,
            child: Opacity(
              opacity: 0.4,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/pokeball_white.png')),
                ),
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.001,
            bottom: -MediaQuery.of(context).size.width * 0.025,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.24,
              height: MediaQuery.of(context).size.height * 0.16,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(pokemonModel!.sprites['front_default'].toString())),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
              // bottom: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.035,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height *
                            0.015,
                      ),
                      child: AutoSizeText(
                        "${pokemonModel!.name}",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: pokemonModel?.types?.length ?? 0,
                    itemBuilder: (context, index) =>
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.010,
                              ),
                              decoration: BoxDecoration(
                                  color:
                                  Colors.white.withOpacity(0.5),
                                  borderRadius:
                                  BorderRadius.circular(30)),
                              child: AutoSizeText(
                                "${TypesPokemonModel.fromJson(pokemonModel?.types?[index]).type!["name"]}",
                                style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 5),
                              )),
                        ),
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Container(
                  //         padding: EdgeInsets.all(10),
                  //         margin: EdgeInsets.only(
                  //           bottom: MediaQuery.of(context)
                  //               .size
                  //               .height *
                  //               0.010,
                  //         ),
                  //         decoration: BoxDecoration(
                  //             color:
                  //             Colors.white.withOpacity(0.5),
                  //             borderRadius:
                  //             BorderRadius.circular(30)),
                  //         child: AutoSizeText(
                  //           "Poison",
                  //           style: TextStyle(
                  //               color: Colors.white
                  //                   .withOpacity(0.6),
                  //               fontWeight: FontWeight.normal,
                  //               fontSize: 5),
                  //         )),
                  //
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


