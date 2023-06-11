import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'models.dart';

class ImageUploadService extends ChangeNotifier {

  String? idFunction;
  File? selectedInputImage;
  File? selectedStyleImage;
  var outputImage;

  void setImageFunctionId(String id) {
    idFunction = id;
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
    return outputImage;
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

  void onSubmitSingleImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.56.1:8000/$idFunction/upload/")
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

    notifyListeners();
  }

  void onSubmitDoubleImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.56.1:8000/$idFunction/upload/")
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

    notifyListeners();
  }

  void clearImage() {
    selectedInputImage = null;
    selectedStyleImage = null;
    outputImage = null;
  }
}