import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
    const SplashPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => const HomePage()))
            );
        });

        return Scaffold(
            backgroundColor: const Color(0xFF0025AA),
            body: Stack(
              children: [
                  Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset("assets/logo_blue.png", width: 200, height: 200,),
                            const SizedBox(height: 5),
                            Text(
                                "ImageGenie",
                                style: GoogleFonts.pacifico(
                                    fontSize: 40,
                                    color: Colors.white,
                                ),
                            ),
                            const SizedBox(height: 50,),
                            const SizedBox(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                    strokeWidth: 8,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                        ],
                      ),
                  ),
                ],
            ),
        );
    }
}