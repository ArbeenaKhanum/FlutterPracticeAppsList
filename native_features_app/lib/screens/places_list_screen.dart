import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_features_app/providers/great_places.dart';
import 'package:native_features_app/screens/add_places_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Consumer<GreatPlaces>(
          child: Center(
            child: Text('Got no places yet, start adding some!'),
          ),
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
              ? ch as Widget
              : ListView.builder(
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatPlaces.items[index].image),
                    ),
                    title: Text(greatPlaces.items[index].title),
                    onTap: () {},
                  ),
                  itemCount: greatPlaces.items.length,
                ),
        ),
      ),
    );
  }
}
