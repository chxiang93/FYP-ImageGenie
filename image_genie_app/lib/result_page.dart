import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils.dart';
import 'services.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

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


    return Scaffold( 
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
                child: Container(
                width: 400,
                height: 500,
                child: imgUploadService.outputImage
              ),
          );
            },
          );
        },
      ),
    );
  }
}