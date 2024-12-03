import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Two',
          style: TextStyle(color: Colors.black), 
        ),
        backgroundColor: Colors.white, 
        elevation: 1, 
        centerTitle: true, 
        iconTheme: const IconThemeData(color: Colors.black), 
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Theme.of(context).colorScheme.primary, 
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: -0.1,
                child: Text(
                  'Welcome to the Home Page',
                  textAlign: TextAlign.center, 
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white, 
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}