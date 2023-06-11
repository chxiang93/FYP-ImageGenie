import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils.dart';
import 'services.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.secondaryColor,
      appBar: const ImageGenieAppBar(),
      body: Consumer<ImageUploadService>(
        builder: (context, imgUploadService, child) {
          return Center(
            child: Container(
              width: 400,
              height: 500,
              child: imgUploadService.outputImage
            ),
          );
        },
      ),
    );
  }
}