import 'package:flutter/material.dart';
import 'package:recipe/consent/appbar.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<favorite> {
  List<String> favoritePhotos = []; // List untuk menyimpan foto-foto favorit

  // Fungsi untuk menandai foto sebagai favorit
  void toggleFavorite(String photoUrl) {
    setState(() {
      if (favoritePhotos.contains(photoUrl)) {
        // Hapus foto dari daftar favorit jika sudah ada
        favoritePhotos.remove(photoUrl);
      } else {
        // Tambahkan foto ke daftar favorit jika belum ada
        favoritePhotos.add(photoUrl);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Favorite Photos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final String photoUrl = 'images/photo${index + 1}.jpg';
                final bool isFavorite = favoritePhotos.contains(photoUrl);
                return GestureDetector(
                  onTap: () {
                    toggleFavorite(photoUrl);
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        photoUrl,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
