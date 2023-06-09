import 'package:flutter/material.dart';
import 'utils.dart';
import 'models.dart';

class CartoonifyPage extends StatelessWidget {
  CartoonifyPage({Key? key}) : super(key: key);

  ImageFunctionInfo cartoonifyInfo = ImageFunctionInfo(
    id: "cartoonify",
    description: "Please upload an image to do cartoonify task."
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
              ImagePlaceholderCard(imgFuncInfo: cartoonifyInfo,),
              UploadButton(),
            ],
          ),
          SubmitButton()
        ],
      ),
    );
  }
}