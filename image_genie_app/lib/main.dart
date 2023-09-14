import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'splash_page.dart';
import 'services.dart';

void main() {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImageUploadService(),
        ),
      ],
      child: const ImageGenieApp(),
    ));
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