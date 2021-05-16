import 'package:startup_namer_original/repo.dart';
import '../common/starter_bloc.dart';
import 'startup_name_view_model_row.dart';

class StartupNameListBloc with StarterBloc<List<ViewModelRow>> {
  Repo _repo;
  StartupNameListBloc(this._repo) {
    generateSuggestions();
  }

  void _refreshDisplay() {
    final viewModelRowList = _repo
        .suggestionList
        .map((suggestion) => ViewModelRow(
            startupName: suggestion.asPascalCase,
            isFavorite: _repo.isFavorite(suggestion)))
        .toList();
    streamAdd(viewModelRowList);
  }

  void generateSuggestions() {
    _repo.generateMoreSuggestions();
    _refreshDisplay();
  }

  void toggle(int index) {
    final suggestion = _repo.suggestionList[index];
    if (_repo.isFavorite(suggestion)) {
      _repo.removeFavorite(suggestion);
    } else {
      _repo.addFavorite(suggestion);
    }
    _refreshDisplay();
  }
}
