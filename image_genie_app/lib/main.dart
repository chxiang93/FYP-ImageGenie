import "package:flutter/material.dart";
import 'splash_page.dart';

void main() {
    runApp(ImageGenieApp());
}

class ImageGenieApp extends StatelessWidget {
    const ImageGenieApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage()
    );
  }
}