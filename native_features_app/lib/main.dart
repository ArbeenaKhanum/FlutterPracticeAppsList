import 'package:flutter/material.dart';
import 'package:native_features_app/providers/great_places.dart';
import 'package:native_features_app/screens/add_places_screen.dart';
import 'package:native_features_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName: (ctx) => AddPlacesScreen(),
        },
      ),
    );
  }
}
