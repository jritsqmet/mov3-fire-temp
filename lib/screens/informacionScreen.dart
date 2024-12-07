import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información"),
      ),
      body: Image.network("https://4kwallpapers.com/images/walls/thumbs_3t/20051.jpeg"),
    );
  }
}