import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

class StartupEntity {
  final int id;
  final String startupName;
  StartupEntity({@required this.id, @required this.startupName});
}

class Repo {
  final _suggestions = <StartupEntity>[];
  final _favoriteList = <int>{};
  static final repo = Repo._();

  Repo._() {
    generateMoreSuggestions();
  }

  List<StartupEntity> get suggestionList => _suggestions;

  StartupEntity getSuggestion(int id) => _suggestions[id];

  void generateMoreSuggestions() {
    final count = _suggestions.length;
    final pairs = generateWordPairs()
        .take(20)
        .map((pair) => pair.asPascalCase)
        .toList()
        .asMap()
        .entries
        .map((entry) =>
            StartupEntity(id: entry.key + count, startupName: entry.value));

    _suggestions.addAll(pairs);
  }

  List<String> get favoriteList =>
      _favoriteList.map((id) => _suggestions[id].startupName).toList();

  bool isFavorite(int id) {
    return _favoriteList.contains(id);
  }

  bool removeFavorite(int id) {
    return _favoriteList.remove(id);
  }

  bool addFavorite(int id) {
    return _favoriteList.add(id);
  }
}
