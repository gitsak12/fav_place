import 'package:favourite_place/Screens/place_detail.dart';
import 'package:favourite_place/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  PlacesList({super.key, required this.places});

  final List<Place> places;

  Widget build(BuildContext) {
    if (places.isEmpty) {
      return const Center(
        child: Text(
          "No places added Yet..",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return PlaceDetailScreen(place: places[index]);
                }));
              },
              title: Text(
                places[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          });
    }
  }
}
