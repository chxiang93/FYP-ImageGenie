import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0025AA),
      body: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(10),
            child: Text("Dashboard", style: TextStyle(fontSize: 16, color: Colors.white),),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFF5F5F5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ImageFunctionCard(imagePath: "assets/sr_icon.png", title: "Super Resolution"),
                      IconFunctionCard(icon: Icons.compare, title: "Neural Style Transfer")
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      IconFunctionCard(icon: Icons.flutter_dash, title: "Cartoonify"),
                      IconFunctionCard(icon: Icons.draw, title: "Text to Image")
                    ],
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
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
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
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(imagePath, width: 50, height: 50,),
          const SizedBox(height: 5,),
          Text(title, style: const TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}