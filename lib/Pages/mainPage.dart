import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pixabay_app/Providers/projectProviders.dart';

import '../Services/ApiServices.dart';

class MainPage extends HookWidget {
  final ValueNotifier<List<String>> _imagesUrlNotifier =
      useState<List<String>>([]);
  final ValueNotifier<bool> _buttonState = useState<bool>(true);
  final imagesUrlListProvider =
      useProvider(ProjectProviders.imagesUrlListProvider);

  void _getImages() async {
    await getImageService().then(
      (results) {
        print(results.length);
        imagesUrlListProvider.addImageUrl(results[0]['largeImageURL']);
        _imagesUrlNotifier.value = imagesUrlListProvider.state;
        print(imagesUrlListProvider.state.toString());
      },
    );
    print('returned');
  }

  @override
  Widget build(BuildContext context) {
    _getImages();

    // Widget gridView = GridView.builder(
    //   gridDelegate:
    //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //   itemCount: imagesUrl.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Image.network(
    //       imagesUrl[index],
    //       fit: BoxFit.cover,
    //     );
    //   },
    // );

    print('end');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PixaBay Application'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: (imagesUrlListProvider.state.toList().isNotEmpty)
                  ? Text(imagesUrlListProvider.state.toList().toString())
                  : Text('Empty'),
              color: Colors.red,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.2,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _buttonState.value = !_buttonState.value;
                  },
                  child: Text('Get Images'))
            ],
          ),
        ),
      ),
    );
  }
}
