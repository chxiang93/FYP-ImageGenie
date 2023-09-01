import 'package:flutter/material.dart';
import 'utils/utils.dart';
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
      body: Hero(
        tag: "neural_transfer",
        flightShuttleBuilder: (BuildContext flightContext, 
                               Animation<double> animation, 
                               HeroFlightDirection flightDirection, 
                               BuildContext fromHeroContext, 
                               BuildContext toHeroContext) {
          return SingleChildScrollView(
            child: fromHeroContext.widget,
          );
        },
        child: Column(
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
      ),
    );
  }
}