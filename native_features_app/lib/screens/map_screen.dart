import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:native_features_app/models/place.dart';

class MapScreen extends StatefulWidget {
  late final PlaceLocation initialLocation;
  late final bool isSelectedImg;

  MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 12.9985, longitude: 77.5921),
      this.isSelectedImg = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation = LatLng(12.9985, 77.5921);

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        actions: [
          if (widget.isSelectedImg)
            IconButton(
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
              icon: const Icon(Icons.check),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialLocation.latitude,
                widget.initialLocation.longitude),
            zoom: 16),
        onTap: widget.isSelectedImg ? _selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelectedImg)
            ? <Marker>{}
            : {
                Marker(
                    markerId: const MarkerId('m1'),
                    position: _pickedLocation ??
                        LatLng(widget.initialLocation.latitude,
                            widget.initialLocation.longitude))
              },
      ),
    );
  }
}
