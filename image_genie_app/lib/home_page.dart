import 'package:flutter/material.dart';
import 'package:image_genie_app/services.dart';
import 'package:provider/provider.dart';
import 'utils.dart';
import 'super_resolution_page.dart';
import 'neural_transfer_page.dart';
import 'cartoonify_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    ImageUploadService imgService = Provider.of<ImageUploadService>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF0025AA),
      appBar: const ImageGenieAppBar(),
      drawer: Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Dashboard", 
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Utils.secondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 8.0,
                    offset: const Offset(2.0, 5.0)
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageFunctionCard(
                          imagePath: "assets/sr_icon.png", 
                          title: "Super Resolution",
                          function: () {

                            imgService.clearImage();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: ((context) => SuperResolutionPage()))
                            );
                          },
                          ),
                        IconFunctionCard(
                          icon: Icons.compare, 
                          title: "Neural Style Transfer",
                          function: () {

                            imgService.clearImage();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: ((context) => NeuralTransferPage()))
                            );
                          },
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconFunctionCard(
                          icon: Icons.flutter_dash, 
                          title: "Cartoonify",
                          function: () {

                            imgService.clearImage();
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: ((context) => CartoonifyPage()))
                            );
                          },
                          ),
                        IconFunctionCard(
                          icon: Icons.draw, 
                          title: "Text to Image",
                          function: () {},
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}

class IconFunctionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function? function;

  const IconFunctionCard({Key? key, required this.icon, required this.title, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(3.0, 5.0),
          ),
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Utils.secondaryColor,
          child: InkWell(
            highlightColor: Colors.black.withOpacity(0.2),
            focusColor: Colors.grey.withOpacity(0.1),
            onTap: () {
              function!();
            },
            child: Container(
              height: 200,
              width: (MediaQuery.of(context).size.width / 2.0) - 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              // margin: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    size: 80,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 5,),
                  Text(title, style: const TextStyle(fontSize: 12),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageFunctionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function? function;

  const ImageFunctionCard({Key? key, required this.imagePath, required this.title, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(3.0, 5.0),
          ),
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Utils.secondaryColor,
          child: InkWell(
            highlightColor: Colors.black.withOpacity(0.2),
            focusColor: Colors.grey.withOpacity(0.1),
            onTap: () {
              function!();
            },
            child: Container(
              height: 200,
              width: (MediaQuery.of(context).size.width / 2.0) - 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              // margin: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(imagePath, width: 80, height: 80,),
                  const SizedBox(height: 5,),
                  Text(title, style: const TextStyle(fontSize: 12),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}