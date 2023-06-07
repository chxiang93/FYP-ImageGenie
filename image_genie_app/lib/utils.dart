import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static Color mainColor = const Color(0xFF0025AA);
  static Color secondaryColor = const Color(0xFFF5F5F5);
}

class ImageGenieAppBar extends StatelessWidget {
  const ImageGenieAppBar({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset("assets/logo_blue.png", width: 20, height: 20,),
            const SizedBox(width: 10,),
            Text(
              "ImageGenie",
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 12
              )
            )
          ],
        ),
    );
  }
}