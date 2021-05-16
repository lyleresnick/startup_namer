import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/bloc_provider.dart';
import '../constants.dart';
import 'startup_name_favorite_list_bloc.dart';

class StartupNameFavoriteListScene extends StatelessWidget {
  final StartupNameFavoriteListBloc _bloc;
  StartupNameFavoriteListScene(this._bloc);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<StartupNameFavoriteListBloc>(
      bloc: _bloc,
      child: StreamBuilder<List<String>>(
          stream: _bloc.stream,
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
          }),
    );
  }
}
