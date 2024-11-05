import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Layout Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'CustomFont', 
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _imagePageController;
  late final PageController _assetPageController;
  int _currentImagePage = 0;
  int _currentAssetPage = 0;
  late Timer _imageTimer;
  late Timer _assetTimer;

  @override
  void initState() {
    super.initState();
    _imagePageController = PageController(initialPage: _currentImagePage);
    _assetPageController = PageController(initialPage: _currentAssetPage);

    _imageTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentImagePage < 2) { 
        _currentImagePage++;
      } else {
        _currentImagePage = 0;
      }
      _imagePageController.animateToPage(
        _currentImagePage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });

    _assetTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentAssetPage < 2) { 
        _currentAssetPage++;
      } else {
        _currentAssetPage = 0;
      }
      _assetPageController.animateToPage(
        _currentAssetPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _imageTimer.cancel();
    _assetTimer.cancel();
    _imagePageController.dispose();
    _assetPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images and Assets'), 
        backgroundColor: Colors.blue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: PageView(
                controller: _imagePageController,
                children: [
                  Image.network(
                    'https://picsum.photos/id/237/200/300',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://picsum.photos/seed/picsum/200/300',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://picsum.photos/200/300?grayscale',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text(
                  'Regular Font Style',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text(
                  'Bold Font Style',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text(
                  'Italic Font Style',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text(
                  'Device Default Font',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _assetPageController,
                children: [
                  Image.asset(
                    'images/image1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/image2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/image3.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}