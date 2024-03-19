import 'package:flutter/material.dart';

import 'main.dart';

class ArtworksGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display a loading indicator while data is being loaded
        } else if (snapshot.hasError) {
          return Text('Error loading data: ${snapshot.error}');
        } else {
          final List<String>? imageUrls = snapshot.data?.cast<String>();
          return Scaffold(
            appBar: AppBar(
              title: Text("Galerie d'œuvres"),
              backgroundColor: color2,
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: imageUrls?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle tap on image
                  },
                  child: Image.network(
                    imageUrls![index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }}