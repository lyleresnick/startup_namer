import 'package:flutter/material.dart';
import 'package:startup_namer_original/common/bloc_builder.dart';
import 'package:startup_namer_original/common/bloc_provider.dart';
import 'package:startup_namer_original/constants.dart';
import 'package:startup_namer_original/startup_name_list/startup_name_list_assembly.dart';
import 'startup_name_list_bloc.dart';
import 'startup_name_view_model_row.dart';

class StartupNameListScene extends StatelessWidget {
  final StartupNameListBloc _bloc;

  StartupNameListScene(this._bloc) {
    _bloc.scrollController.addListener(() {
      if (_isScrolledToBottom) {
        _bloc.generateSuggestions();
      }
    });
  }

  bool get _isScrolledToBottom =>
      _bloc.scrollController.position.maxScrollExtent <=
      _bloc.scrollController.position.pixels;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartupNameListBloc, List<ViewModelRow>>(
        bloc: _bloc,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          final viewModelList = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                title: Text('Startup Name Generator (Bloc)'),
                actions: [
                  IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () => _showFavorites(context)),
                ],
              ),
              body: ListView.builder(
                  controller: _bloc.scrollController,
                  padding: EdgeInsets.all(16.0),
                  itemCount: viewModelList.length,
                  itemBuilder: (context, i) {
                    return _StartUpNameRow(
                        viewModelRow: viewModelList[i], index: i);
                  }));
        });
  }

  void _showFavorites(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return StartupNameFavoriteListAssembly().scene;
    }));
  }
}

class _StartUpNameRow extends StatelessWidget {
  final ViewModelRow viewModelRow;
  final int index;
  _StartUpNameRow({this.viewModelRow, this.index});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StartupNameListBloc>(context);

    return Column(
      children: [
        if (index > 0) Divider(),
        ListTile(
            title: Text(
              viewModelRow.startupName,
              style: Constants.biggerFont,
            ),
            trailing: Icon(
              viewModelRow.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: viewModelRow.isFavorite ? Colors.red : null,
            ),
            onTap: () {
              bloc.toggle(index);
            })
      ],
    );
  }
}
