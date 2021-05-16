import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer_original/common/bloc_builder.dart';
import 'package:startup_namer_original/constants.dart';
import 'startup_name_favorite_list_bloc.dart';

class StartupNameFavoriteListScene extends StatelessWidget {
  final StartupNameFavoriteListBloc _bloc;
  StartupNameFavoriteListScene(this._bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartupNameFavoriteListBloc, List<String>>(
        bloc: _bloc,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final tiles = snapshot.data.map((favorite) => ListTile(
                title: Text(
                  favorite,
                  style: Constants.biggerFont,
                ),
              ));
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(context: context, tiles: tiles).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: Text('Favorites'),
            ),
            body: ListView(children: divided),
          );
        });
  }
}
