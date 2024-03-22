import 'package:flutter/material.dart';
import 'main.dart';

class ArtworksGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Afficher un indicateur de chargement pendant le chargement des données
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Erreur lors du chargement des données: ${snapshot.error}'),
          ); // Afficher un message d'erreur en cas d'échec de chargement des données
        } else {
          final List<String>? imageUrls = snapshot.data?.cast<String>();
          return Scaffold(
            appBar: AppBar(
              title: Text("Galerie d'œuvres"),
              backgroundColor: Color(0xFF212222), // Utiliser la couleur de fond neutre
              // Assurez-vous qu'il n'y a pas de propriété 'leading' ici
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05), // Utiliser 5% de la largeur de l'écran comme padding horizontal
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Afficher 3 images par rangée
                      crossAxisSpacing: 16, // Utiliser la valeur de l'espacement de grille définie
                      mainAxisSpacing: 16, // Utiliser la valeur de l'espacement de grille définie
                    ),
                    itemCount: imageUrls?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _showImageDialog(context, imageUrls![index]);
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Color(0xFF212222), // Utiliser la couleur de fond neutre
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              imageUrls![index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
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
