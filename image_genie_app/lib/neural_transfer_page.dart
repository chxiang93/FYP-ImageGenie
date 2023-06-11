import 'package:flutter/material.dart';
import 'utils.dart';
import 'models.dart';

class NeuralTransferPage extends StatelessWidget {
  NeuralTransferPage({Key? key}) : super(key: key);

  ImageFunctionInfo contentImgInfo = ImageFunctionInfo(
    id: "neural_transfer",
    description: "Please upload a content image to do neural style transfer task."
  );

  ImageFunctionInfo styleImgInfo = ImageFunctionInfo(
    id: "neural_transfer",
    description: "Please upload a style image to do neural style transfer task."
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.secondaryColor,
      appBar: const ImageGenieAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImagePlaceholderCard(imgFuncInfo: contentImgInfo,),
                  UploadButton(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StyleImagePlaceholderCard(imgFuncInfo: styleImgInfo,),
                  UploadButtonStyle(),
                ],
              ),
            ],
          ),
          SubmitButtonTwoImage()
        ],
      ),
    );
  }
}