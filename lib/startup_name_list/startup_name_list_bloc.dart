import 'package:flutter/widgets.dart';
import 'package:startup_namer_original/repo.dart';
import '../common/starter_bloc.dart';
import 'startup_name_view_model_row.dart';

class StartupNameListBloc with StarterBloc<List<ViewModelRow>> {
  Repo _repo;
  List<StartupEntity> _cachedEntityList;
  final scrollController = ScrollController();

  StartupNameListBloc(this._repo) {
    generateSuggestions();
  }

  void _refreshDisplay() {
    _cachedEntityList = _repo.suggestionList;
    final viewModelRowList = _cachedEntityList
        .map((suggestion) => ViewModelRow(
            startupName: suggestion.startupName,
            isFavorite: _repo.isFavorite(suggestion.id)))
        .toList();
    streamAdd(viewModelRowList);
  }

  void generateSuggestions() {
    _repo.generateMoreSuggestions();
    _refreshDisplay();
  }

  void toggle(int index) {
    final id = _cachedEntityList[index].id;
    if (_repo.isFavorite(id)) {
      _repo.removeFavorite(id);
    } else {
      _repo.addFavorite(id);
    }
    _refreshDisplay();
  }

  @override
  dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
