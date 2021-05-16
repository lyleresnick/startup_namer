import 'package:startup_namer_original/repo.dart';
import '../common/starter_bloc.dart';

class StartupNameFavoriteListBloc with StarterBloc<List<String>> {
  Repo _repo;

  StartupNameFavoriteListBloc(this._repo) {
    _initialize();
  }

  void _initialize() {
    final favorites = _repo.favoriteList;
    streamAdd(favorites);
  }
}
