import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ImageGenie/services.dart';
import 'colors.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}