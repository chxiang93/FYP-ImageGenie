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
            Container(
              decoration: BoxDecoration(
                color: Utils.secondaryColor,
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 3.0,
                    spreadRadius: 3.0
                  ),
                ],
              ),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Neural style transfer combines the content from your own content image (like your face or a pet) with "
                "the artistic style of a famous painting (like Van Gogh's \"Starry Night\"), creating a new image "
                "that retains your content but looks as if it were painted in the style of the masterpiece.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Expanded(
              child: Row(
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
            ),
            SubmitButtonTwoImage()
          ],
        ),
      ),
    );
  }
}