import 'package:flutter/material.dart';
import 'colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFBDBDBD).withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(1.0, 2.0),
              blurRadius: 5.0,
              spreadRadius: 3.0
            ),
          ],
        ),
        width: 150,
        height: 150,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 90,
                height: 90,
                child: CircularProgressIndicator(
                  strokeWidth: 10.0,
                  valueColor: AlwaysStoppedAnimation(Utils.mainColor),
                ),
              ),
            ),
            Center(
              child: Image.asset("assets/logo_black.png", width: 50, height: 50,),
            ),
          ],
        ),
      ),
    );
  }
}