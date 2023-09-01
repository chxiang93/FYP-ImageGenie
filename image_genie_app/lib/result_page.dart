import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'super_resolution_page.dart';
import 'neural_transfer_page.dart';
import 'utils/utils.dart';
import 'services.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<bool>? _getOutputImageFuture;

  @override
  Widget build(BuildContext context) {
    ImageUploadService imgService = Provider.of<ImageUploadService>(context, listen: false);

    if(imgService.getIdFunction() == "super_resolution") {
      _getOutputImageFuture = imgService.onSubmitSingleImage();
    }
    else if(imgService.getIdFunction() == "neural_transfer") {
      _getOutputImageFuture = imgService.onSubmitDoubleImage();
    }

    return WillPopScope(
      onWillPop: () async {
        imgService.clearImage();

        if(imgService.getIdFunction() == "super_resolution") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SuperResolutionPage()
            )
          );
        }
        else if(imgService.getIdFunction() == "neural_transfer") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NeuralTransferPage() )
          );
        }

        return true;
      },
      child: Scaffold( 
        backgroundColor: Utils.secondaryColor,
        appBar: const ImageGenieAppBar(),
        body: Consumer<ImageUploadService>(
          builder: (context, imgUploadService, child) {
            return FutureBuilder(
              future: _getOutputImageFuture,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(!snapshot.hasData) {
                  return const LoadingWidget();
                }
    
                if(snapshot.hasError) {
                  return const Text("Error!", textAlign: TextAlign.center, style: TextStyle(fontSize: 60, color: Colors.red, fontWeight: FontWeight.bold),);
                }
    
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Result Page:",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0)
                          ),
                          width: imgUploadService.outputImage!.width,
                          height: imgUploadService.outputImage!.height,
                          child: imgUploadService.outputImage
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              XFile file = XFile(imgUploadService.getOutputImageFile().path);
                              await Share.shareXFiles([file], text: "Check out my new image!");
                            },
                            icon: Icon(
                              Icons.share,
                              color: Utils.secondaryColor,
                              size: 25,
                            ),
                            label: const Text("Share"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              elevation: 5,
                              primary: Utils.mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Utils.mainColor.withOpacity(0.1),
                              textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              _saveImage(context, imgUploadService.getOutputImageFile());
                            },
                            icon: Icon(
                              Icons.save,
                              color: Utils.secondaryColor,
                              size: 27,
                            ),
                            label: const Text("Download"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              elevation: 5,
                              primary: Utils.mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadowColor: Utils.mainColor.withOpacity(0.1),
                              textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
            );
              },
            );
          },
        ),
      ),
    );
  }
}

void _saveImage(BuildContext context, File image) {
  String? message = "test";
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  // Save the image
  GallerySaver.saveImage(
    image.path,
    albumName: "ImageGenie",
  )
  .then((success) { 
    message = "The image saved to the device successfully in Pictures/ImageGenie"; 
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(message!, style: const TextStyle(fontSize: 22),),
      backgroundColor: Utils.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 15.0,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
    ));
  })
  .catchError( (error) { 
    message = "There is error when trying to save the image"; 
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message!, style: const TextStyle(fontSize: 20), textAlign: TextAlign.justify,)));
  });
}