import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services.dart';
import 'utils/utils.dart';
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
      body: Hero(
        tag: "super_resolution",
        flightShuttleBuilder: (BuildContext flightContext,
                                Animation<double> animation,
                                HeroFlightDirection flightDirection,
                                BuildContext fromHeroContext,
                                BuildContext toHeroContext,){

              return SingleChildScrollView(
                child: fromHeroContext.widget,
          );},
        child: Column(
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
      ),
    );
  }
}