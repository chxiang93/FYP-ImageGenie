import 'package:flutter/material.dart';
import 'utils.dart';

class SuperResolutionPage extends StatelessWidget {
  const SuperResolutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.mainColor,
      appBar: const ImageGenieAppBar(),
      drawer: Drawer(),
      body: Column(
        children: const [
          ImagePlaceholderCard(),
          UploadButton(),
          SubmitButton()
        ],
      ),
    );
  }
}