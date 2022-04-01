import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../Services/ApiServices.dart';

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    void _getImages() {
      getImageService().then((results) {
        for (var i in results.data) {}
      });
      return;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PixaBay Application'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
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
                    _getImages();
                  },
                  child: Text('Get Images'))
            ],
          ),
        ),
      ),
    );
  }
}
