import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_features_app/providers/great_places.dart';
import 'package:native_features_app/screens/add_places_screen.dart';
import 'package:native_features_app/screens/places_detail_screen.dart';
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
        child: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlaces>(
                  child: Center(
                    child: Text('Got no places yet, start adding some!'),
                  ),
                  builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <=
                          0
                      ? ch as Widget
                      : ListView.builder(
                          itemBuilder: (ctx, index) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  FileImage(greatPlaces.items[index].image),
                            ),
                            title: Text(greatPlaces.items[index].title),
                            subtitle:
                                Text(greatPlaces.items[index].location.address),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  PlacesDetailScreen.routeName,
                                  arguments: greatPlaces.items[index].id);
                            },
                          ),
                          itemCount: greatPlaces.items.length,
                        ),
                ),
        ),
      ),
    );
  }
}
