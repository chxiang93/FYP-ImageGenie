import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';
import 'models.dart';

class ImageUploadService extends ChangeNotifier {

  String? _idFunction;
  File? selectedInputImage;
  File? selectedStyleImage;
  Image? outputImage;
  File? outputImageFile;

  void setImageFunctionId(String id) {
    _idFunction = id;
  }

  String getIdFunction() {
    return _idFunction!;
  }

  void onSelectedInputImage(File img) {
    selectedInputImage = img;
    notifyListeners();
  }

  File? getSelectedInputImage() {
    return selectedInputImage;
  }

  File? getSelectedStyleImage() {
    return selectedStyleImage;
  }

  Image getOutputImage() {
    return outputImage!;
  }

  File getOutputImageFile() {
    return outputImageFile!;
  }

  void onSelectedStyleImage(File img) {
    selectedStyleImage = img;
    notifyListeners();
  }

  bool validationInputImage() {
    return !(selectedInputImage == null);
  }

  bool validationStyleImage() {
    return !(selectedStyleImage == null);
  }

  bool validationSubmitSingleImage() {
    return !(selectedInputImage == null);
  }

  bool validationSubmitDoubleImage() {
    return ((selectedInputImage != null) && (selectedStyleImage != null));
  }

  Future<bool> onSubmitSingleImage() async {

    Completer<bool> imgCompleter = Completer();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.56.1:8000/$_idFunction/upload/")
    );

    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    request.files.add(
      http.MultipartFile(
        'input_image',
        selectedInputImage!.readAsBytes().asStream(),
        selectedInputImage!.lengthSync(),
        filename: selectedInputImage!.path.split('/').last,
      ),
    );

    request.headers.addAll(headers);

    print("request: " + request.toString());

    var res = await request.send();

    http.Response response = await http.Response.fromStream(res);

    outputImage = Image.memory(response.bodyBytes);

    // Get temporary directory
    final dir = await getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/image.png';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes);

    outputImageFile = file;
  
    Future.delayed(const Duration(seconds: 1), () {
        imgCompleter.complete(true);

        notifyListeners();
    });
    
    return imgCompleter.future;
  }

  Future<bool> onSubmitDoubleImage() async {
    Completer<bool> imgCompleter = Completer();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.56.1:8000/$_idFunction/upload/")
    );

    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    request.files.add(
      http.MultipartFile(
        'input_image',
        selectedInputImage!.readAsBytes().asStream(),
        selectedInputImage!.lengthSync(),
        filename: selectedInputImage!.path.split('/').last,
      ),
    );

    request.files.add(
      http.MultipartFile(
        'style_image',
        selectedStyleImage!.readAsBytes().asStream(),
        selectedStyleImage!.lengthSync(),
        filename: selectedStyleImage!.path.split('/').last,
      ),
    );

    request.headers.addAll(headers);

    print("request: " + request.toString());

    var res = await request.send();

    http.Response response = await http.Response.fromStream(res);

    outputImage = Image.memory(response.bodyBytes);

    Future.delayed(const Duration(seconds: 1), () {
      imgCompleter.complete(true);
      notifyListeners();
    });

    return imgCompleter.future;
  }

  void clearImage() {
    selectedInputImage = null;
    selectedStyleImage = null;
    outputImage = null;
  }
}