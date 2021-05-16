import 'package:startup_namer_original/repo.dart';
import 'package:startup_namer_original/startup_name_list/startup_name_list_bloc.dart';
import 'package:startup_namer_original/startup_name_list/startup_name_list_scene.dart';

class StartupNameListAssembly {
    final StartupNameListScene scene;

    StartupNameListAssembly._({this.scene});

    factory StartupNameListAssembly() {
        final bloc = StartupNameListBloc(Repo.repo);
        final scene = StartupNameListScene(bloc);

        return StartupNameListAssembly._(scene: scene);
    }
}
