import 'package:flutter/material.dart';
import 'package:recipe/consent/appbar.dart';

class Category extends StatelessWidget {
  const Category({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 270,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigasi ke halaman baru ketika gambar diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(index)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('images/${index + 1}c.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('You tapped image ${index + 1}'),
      ),
    );
  }
}
