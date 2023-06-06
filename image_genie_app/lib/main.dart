import "package:flutter/material.dart";

void main() {
    runApp(ImageGenieApp());
}

class ImageGenieApp extends StatelessWidget {
    const ImageGenieApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container()
    );
  }
}