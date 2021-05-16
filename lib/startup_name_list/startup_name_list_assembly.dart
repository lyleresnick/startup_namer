import 'package:startup_namer_original/repo.dart';
import 'package:startup_namer_original/startup_name_favorite_list/startup_name_favorite_list_bloc.dart';
import 'package:startup_namer_original/startup_name_favorite_list/startup_name_favorite_list_scene.dart';

class StartupNameFavoriteListAssembly {
    final StartupNameFavoriteListScene scene;

    StartupNameFavoriteListAssembly._({this.scene});

    factory StartupNameFavoriteListAssembly() {
        final bloc = StartupNameFavoriteListBloc(Repo.repo);
        final scene = StartupNameFavoriteListScene(bloc);

        return StartupNameFavoriteListAssembly._(scene: scene);
    }
}
