import 'dart:io';

import 'package:favourite_place/Providers/user_places.dart';
import 'package:favourite_place/Widgets/image_input.dart';
import 'package:favourite_place/Widgets/location_input.dart';
import 'package:favourite_place/models/place.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  late File _selectedImage;

  void _savePlace() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredText, _selectedImage!);
    // agar hmm sirf provider name read kr rhe hai, agar hme notifier class read krni hai toh .notifier likho
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              decoration: InputDecoration(
                  hintText: "Place",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 15,
                  )),
              controller: _titleController,
            ),
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            }),
            SizedBox(
              height: 10,
            ),
            LocationInput(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: _savePlace,
                icon: Icon(Icons.add),
                label: Text("Add Place"))
          ],
        ),
      ),
    );
  }
}
