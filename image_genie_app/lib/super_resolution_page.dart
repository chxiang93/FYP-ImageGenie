import 'package:flutter/material.dart';
import 'utils.dart';

class SuperResolutionPage extends StatelessWidget {
  const SuperResolutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.secondaryColor,
      appBar: const ImageGenieAppBar(),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              ImagePlaceholderCard(),
              UploadButton(),
            ],
          ),
          const SubmitButton()
        ],
      ),
    );
  }
}