import 'package:flutter/material.dart';

class VirtualTourScreen extends StatelessWidget {
  const VirtualTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Screen Content')),
    );
  }
}
