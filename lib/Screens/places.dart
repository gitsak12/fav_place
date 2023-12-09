import 'package:favourite_place/Providers/user_places.dart';
import 'package:favourite_place/Screens/add_place.dart';
import 'package:favourite_place/Widgets/places.list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddPlaceScreen();
                }));
              },
              icon: Icon(Icons.add),
              color: Colors.white),
        ],
      ),
      body: PlacesList(places: userPlaces),
    );
  }
}
