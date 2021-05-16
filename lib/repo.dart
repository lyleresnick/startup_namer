

import 'package:english_words/english_words.dart';

class Repo {
    final _suggestions = <WordPair>[];
    final _favoriteList = <WordPair>{};
    static final repo = Repo._();

    Repo._();

    List<WordPair> get suggestionList => _suggestions;


    void generateMoreSuggestions() {
        _suggestions.addAll(generateWordPairs().take(20));
    }

    List<WordPair> get favoriteList => _favoriteList.toList();

    bool isFavorite(WordPair pair) {
        return _favoriteList.contains(pair);
    }

    bool removeFavorite(WordPair pair) {
        return _favoriteList.remove(pair);
    }
    bool addFavorite(WordPair pair) {
        return _favoriteList.add(pair);
    }
}

