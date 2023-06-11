import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'models.dart';
import 'services.dart';
import 'result_page.dart';

class Utils {
  static Color mainColor = const Color(0xFF0025AA);
  static Color secondaryColor = const Color(0xFFF5F5F5);
  static Color mainColorLight = const Color(0xFF055AFF);
}

class ImageGenieAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ImageGenieAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override 
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Utils.mainColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo_blue.png", width: 40, height: 40,),
            const SizedBox(width: 5,),
            Text(
              "ImageGenie",
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 20
              )
            )
          ],
        ),
        actions: const [
          SizedBox(width: 50,)
        ],
    );
  }
}

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
                  fit: BoxFit.cover) 
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
                fit: BoxFit.cover) 
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

class UploadButton extends StatelessWidget {
  const UploadButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ImageUploadService imgService = Provider.of<ImageUploadService>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Utils.mainColorLight,
          child: InkWell(
            highlightColor: Utils.secondaryColor.withOpacity(0.2),
            focusColor: Utils.secondaryColor.withOpacity(0.1),
            onTap: () async {

              var image = await ImagePicker().pickImage(source: ImageSource.gallery);
              var selectedImage = File(image!.path);
              imgService.onSelectedInputImage(selectedImage);

            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Utils.mainColor),
                boxShadow: [
                  BoxShadow(
                    color: Utils.mainColor.withOpacity(0.2),
                    blurRadius: 8.0,
                    offset: const Offset(2.0, 5.0)
                  )
                ],
              ),
              child: const Text(
                "Upload",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadButtonStyle extends StatelessWidget {
  const UploadButtonStyle({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ImageUploadService imgService = Provider.of<ImageUploadService>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Utils.mainColorLight,
          child: InkWell(
            highlightColor: Utils.secondaryColor.withOpacity(0.2),
            focusColor: Utils.secondaryColor.withOpacity(0.1),
            onTap: () async {

              var image = await ImagePicker().pickImage(source: ImageSource.gallery);
              var selectedImage = File(image!.path);
              imgService.onSelectedStyleImage(selectedImage);

            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Utils.mainColor),
                boxShadow: [
                  BoxShadow(
                    color: Utils.mainColor.withOpacity(0.2),
                    blurRadius: 8.0,
                    offset: const Offset(2.0, 5.0)
                  )
                ],
              ),
              child: const Text(
                "Upload",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ImageUploadService>(
      builder: (context, imgUploadService, child) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: (imgUploadService.validationSubmitSingleImage()) ?Utils.mainColorLight : Colors.grey,
              child: InkWell(
                highlightColor: Utils.secondaryColor.withOpacity(0.2),
                focusColor: Utils.secondaryColor.withOpacity(0.1),
                onTap: (imgUploadService.validationSubmitSingleImage()) ? () {

                  imgUploadService.onSubmitSingleImage();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => ResultPage()))
                  );

                } : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Utils.mainColor),
                    boxShadow: [
                      BoxShadow(
                        color: Utils.mainColor.withOpacity(0.2),
                        blurRadius: 8.0,
                        offset: const Offset(2.0, 5.0)
                      )
                    ],
                  ),
                  child: const Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SubmitButtonTwoImage extends StatelessWidget {
  SubmitButtonTwoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<ImageUploadService>(
      builder: (context, imgUploadService, child) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: (imgUploadService.validationSubmitDoubleImage()) ? Utils.mainColorLight : Colors.grey,
              child: InkWell(
                highlightColor: Utils.secondaryColor.withOpacity(0.2),
                focusColor: Utils.secondaryColor.withOpacity(0.1),
                onTap: (imgUploadService.validationSubmitDoubleImage()) ? () {

                  imgUploadService.onSubmitDoubleImage();

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => ResultPage()))
                  );

                } : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Utils.mainColor),
                    boxShadow: [
                      BoxShadow(
                        color: Utils.mainColor.withOpacity(0.2),
                        blurRadius: 8.0,
                        offset: const Offset(2.0, 5.0)
                      )
                    ],
                  ),
                  child: const Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}