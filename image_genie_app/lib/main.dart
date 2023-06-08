import "package:flutter/material.dart";
import 'cartoonify_page.dart';
import 'splash_page.dart';
import 'home_page.dart';
import 'super_resolution_page.dart';

void main() {
    runApp(const ImageGenieApp());
}

class ImageGenieApp extends StatelessWidget {
    const ImageGenieApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: CartoonifyPage()
        );
  }
}