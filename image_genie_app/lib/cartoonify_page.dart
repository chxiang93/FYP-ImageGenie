import 'package:flutter/material.dart';
import 'utils.dart';

class CartoonifyPage extends StatelessWidget {
  const CartoonifyPage({Key? key}) : super(key: key);

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