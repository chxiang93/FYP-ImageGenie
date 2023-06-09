import 'package:flutter/material.dart';
import 'utils.dart';
import 'models.dart';

class SuperResolutionPage extends StatelessWidget {
  SuperResolutionPage({Key? key}) : super(key: key);

  ImageFunctionInfo srInfo = ImageFunctionInfo(
    id: "super_resolution",
    description: "Please upload an image to do super resolution task."
  );

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
            children: [
              ImagePlaceholderCard(imgFuncInfo: srInfo,),
              UploadButton(),
            ],
          ),
          SubmitButton()
        ],
      ),
    );
  }
}