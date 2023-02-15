import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://image.pngaaa.com/746/30746-middle.png',
              fit: BoxFit.cover,
            ),
            const Text('Loading...'),
            const Text('Shopping App'),
          ],
        ),
      ),
    );
  }
}
