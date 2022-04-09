import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pixabay_app/Providers/projectProviders.dart';

import '../Services/ApiServices.dart';

class MainPage extends HookWidget {
  Widget? _getImages() {
    FutureBuilder(
      future: getImageService(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<String> imagesUrlList = <String>[];
        List<Widget> widgetList = [];
        if (snapshot.hasData) {
          imagesUrlList = [...imagesUrlList, snapshot.data];
          widgetList.add(Image.network(imagesUrlList[0]));
          widgetList.add(Image.network('https://picsum.photos/250?image=9'));
        } else {
          widgetList.add(Container());
        }
        return Column(
          children: widgetList,
        );
      },
    );
  }

  // Widget gridView = GridView.builder(
  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //   itemCount: imagesUrl.length,
  //   itemBuilder: (BuildContext context, int index) {
  //     return Image.network(
  //       imagesUrl[index],
  //       fit: BoxFit.cover,
  //     );
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<String>> _imagesUrlNotifier =
        useState<List<String>>([]);
    final ValueNotifier<bool> _buttonState = useState<bool>(true);

    // Widget _loadingPage = FutureBuilder(
    //   future: getImageService(),
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     List<Widget> widgetList;
    //     if (snapshot.hasData) {
    //       List<String> imagesUrlList = <String>[];
    //       for (var i = 0; i < snapshot.data.length; i++) {
    //         imagesUrlList = [
    //           ...imagesUrlList,
    //           snapshot.data[i]['largeImageURL']
    //         ];
    //         print(imagesUrlList.length);
    //       }
    //       widgetList = <Widget>[
    //         // Padding(
    //         //   padding: const EdgeInsets.only(top: 16),
    //         //   child: Text('Result: ${snapshot.data}'),
    //         // )
    //       ];
    //       _buttonState.value = !_buttonState.value;
    //     } else if (snapshot.hasError) {
    //       widgetList = <Widget>[
    //         const Icon(
    //           Icons.error_outline,
    //           color: Colors.red,
    //           size: 60,
    //         ),
    //         // Padding(
    //         //   padding: const EdgeInsets.only(top: 16),
    //         //   child: Text('Error: ${snapshot.error}'),
    //         // )
    //       ];
    //     } else {
    //       widgetList = const <Widget>[
    //         SizedBox(
    //           width: 60,
    //           height: 60,
    //           child: CircularProgressIndicator(),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(top: 16),
    //           child: Text('Awaiting result...'),
    //         )
    //       ];
    //     }
    //     return Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: widgetList,
    //       ),
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
        child: FutureBuilder(
          future: getImageService(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<String> imagesUrlList = [];
            Widget widgetItem;
            if (snapshot.hasData) {
              List<String> testList = [];
              for (var i = 0; i < 10; i++) {
                testList = [...testList, snapshot.data[i]['largeImageURL']];
              }
              Widget gridImage = GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: testList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    testList[index],
                    fit: BoxFit.cover,
                  );
                },
              );
              widgetItem = gridImage;
            } else {
              widgetItem = Container();
            }
            return Container(
              child: widgetItem,
            );
          },
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
