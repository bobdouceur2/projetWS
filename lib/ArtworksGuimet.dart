import 'package:flutter/material.dart';
import 'main.dart';

class ArtworksGuimet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadJsonDataGuimet(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Display a loading indicator while data is being loaded
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error loading data: ${snapshot.error}'),
          );
        } else {
          final List<String>? imageUrls = snapshot.data?.cast<String>();
          return Scaffold(
            appBar: AppBar(
              title: Text("Galerie d'œuvres"),
              backgroundColor: Color(0xFF212222),
              // Assurez-vous qu'il n'y a pas de propriété 'leading' ici
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: imageUrls?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle tap on image
                    _showImageDialog(context, imageUrls![index]);
                  },
                  child: Image.network(
                    imageUrls![index],
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Text('Could not load image');
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xFF212222), // Utiliser la couleur de fond neutre
          insetPadding: EdgeInsets.all(0), // Supprimer les marges internes
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Fermer le dialogue lorsqu'on clique sur l'image
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain, // Afficher l'image au complet
              ),
            ),
          ),
        );
      },
    );
  }
}
