import 'package:flutter/material.dart';
import 'utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0025AA),
      appBar: const ImageGenieAppBar(),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(10),
            child: Text("Dashboard", style: TextStyle(fontSize: 16, color: Colors.white),),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Utils.secondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 8.0,
                    offset: const Offset(2.0, 5.0)
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        ImageFunctionCard(imagePath: "assets/sr_icon.png", title: "Super Resolution"),
                        IconFunctionCard(icon: Icons.compare, title: "Neural Style Transfer")
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        IconFunctionCard(icon: Icons.flutter_dash, title: "Cartoonify"),
                        IconFunctionCard(icon: Icons.draw, title: "Text to Image")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}

class IconFunctionCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const IconFunctionCard({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.black,
          ),
          const SizedBox(height: 5,),
          Text(title, style: const TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}

class ImageFunctionCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ImageFunctionCard({Key? key, required this.imagePath, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Utils.secondaryColor,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(2.0, 5.0),
          ),
        ]
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          Image.asset(imagePath, width: 60, height: 60,),
          const SizedBox(height: 5,),
          Text(title, style: const TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}