import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ImageGenie/services.dart';
import 'colors.dart';
import 'package:ImageGenie/result_page.dart';

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
              color: (imgUploadService.validationSubmitSingleImage()) ? Utils.mainColorLight : Colors.grey,
              child: InkWell(
                highlightColor: Utils.secondaryColor.withOpacity(0.2),
                focusColor: Utils.secondaryColor.withOpacity(0.1),
                onTap: (imgUploadService.validationSubmitSingleImage()) ? () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => ResultPage()))
                  );

                } : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => ResultPage()))
                  );

                } : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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