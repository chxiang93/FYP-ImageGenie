import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

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
            Image.asset("assets/logo_blue.png", width: 50, height: 50,),
            const SizedBox(width: 5,),
            Text(
              "ImageGenie",
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 27
              )
            )
          ],
        ),
        actions: const [
          SizedBox(width: 53,)
        ],
    );
  }
}