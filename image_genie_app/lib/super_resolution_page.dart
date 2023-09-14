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
                "Image super-resolution is a process used to enhance the quality and clarity of an image, "
                "making it look sharper and more detailed. It's like turning a low-resolution or blurry photo "
                "into a high-resolution one, without actually taking a higher resolution photo in the first place.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImagePlaceholderCard(imgFuncInfo: srInfo,),
                  UploadButton(),
                ],
              ),
            ),
            SubmitButton()
          ],
        ),
      ),
    );
  }
}