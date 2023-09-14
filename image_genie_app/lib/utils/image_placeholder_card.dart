import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ImageGenie/models.dart';
import 'package:ImageGenie/services.dart';

class ImagePlaceholderCard extends StatelessWidget {
  final ImageFunctionInfo imgFuncInfo;

  const ImagePlaceholderCard({Key? key, required this.imgFuncInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageUploadService>(
      builder: (context, imgUploadService, child) {
        imgUploadService.setImageFunctionId(imgFuncInfo.id!);

        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            width: (imgFuncInfo.id != "neural_transfer") 
            ? MediaQuery.of(context).size.width - 100 : 150,
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              image: 
              ( imgUploadService.validationInputImage() )
                ? DecorationImage(
                  image: FileImage(imgUploadService.getSelectedInputImage()!),
                  fit: BoxFit.fill) 
                : null,
            ),
            child: 
              ( imgUploadService.validationInputImage() )
              ? null
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate, size: 90, color: Colors.black.withOpacity(0.5),),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      imgFuncInfo.description!,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                  ),
                ],
              ),
          ),
        );
      },
    );
  }
}

class StyleImagePlaceholderCard extends StatelessWidget {
  final ImageFunctionInfo imgFuncInfo;

  const StyleImagePlaceholderCard({Key? key, required this.imgFuncInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Consumer<ImageUploadService>(
      builder: (context, imgUploadService, child) {
        imgUploadService.setImageFunctionId(imgFuncInfo.id!);

        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            width: (imgFuncInfo.id != "neural_transfer") 
            ? MediaQuery.of(context).size.width - 100 : 150,
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              image: 
              ( imgUploadService.validationStyleImage() )
              ? DecorationImage(
                image: FileImage(imgUploadService.getSelectedStyleImage()!),
                fit: BoxFit.fill) 
              : null
            ),
            child: 
              ( imgUploadService.validationStyleImage() )
              ? null
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate, size: 90, color: Colors.black.withOpacity(0.5),),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      imgFuncInfo.description!,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
                    ),
                  ),
                ],
              ),
          ),
        );
      },
    );
  }
}