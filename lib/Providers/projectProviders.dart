import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectProviders {
  static final imagesUrlListProvider =
      StateNotifierProvider.autoDispose((_) => ImagesUrlListNotifier());
}

/// Notifiers
class ImagesUrlListNotifier extends StateNotifier<List<String>> {
  ImagesUrlListNotifier() : super([]);

  void addImageUrl(newUrl) {
    state = [...state, newUrl];
  }
}
