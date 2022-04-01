import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../Services/ApiServices.dart';

class MainPage extends HookWidget {
  List<String> imagesUrl = [];

  @override
  Widget build(BuildContext context) {
    void _getImages() {
      getImageService().then((results) {
        for (var i = 0; i < results.length; i++) {
          imagesUrl.add(results[i]['imageURL'] ?? '');
        }
      });
    }

    _getImages();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PixaBay Application'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: imagesUrl.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imagesUrl[index],
            fit: BoxFit.cover,
          );
        },
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.2,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Get Images'))
            ],
          ),
        ),
      ),
    );
  }
}
