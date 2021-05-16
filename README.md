# startup_namer

This app generates proposals for StartUp names. 

This should sound familiar, as this code is a refactor of the app which is produced when you follow [Flutter CodeLabs part 1 & 2](https://flutter.dev/docs/codelabs). This refactor uses an implementation of the BLoC architecture.

You can find the original solution [here](https://github.com/flutter/codelabs/blob/codelab/startup_namer/step8_themes/lib/main.dart).

There are 2 branches: `main` and `without entities`. 

The `without entities` branch exposes the implementation of the word pairs. 

The `main` branch refactors the repository to deliver Domain Entities with ids and shows how those ids are used to translate selection indexes to ids. 

