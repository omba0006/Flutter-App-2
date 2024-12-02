import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Half
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image1.jpg'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Bottom Half
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: -0.1, 
                child: Text(
                  'Welcome to the Home Page',
                  style: Theme.of(context).textTheme.titleLarge, 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}