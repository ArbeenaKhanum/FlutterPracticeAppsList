import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/126/126083.png?w=1380&t=st=1676471267~exp=1676471867~hmac=93bcd585b00031d9d000b050b2978cfb44782c52fe444fd45a9432fb493220d1',
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
