import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loginFirebase/Widgets/services/geolocator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapp extends StatefulWidget {
  final Position intialPosition;
  Mapp(this.intialPosition);
  @override
  _MappState createState() => _MappState();
}

class _MappState extends State<Mapp> {
  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();
  Color _darkblue = Colors.blue[600];

  @override
  void initState() {
    geoService.getCurrentLocation().listen(
      (position) {
        centerScreen(position);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(
            "GEO LOCATION",
            style: TextStyle(
              color: _darkblue,
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: Center(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.intialPosition.latitude,
                  widget.intialPosition.longitude),
              zoom: 18.5,
            ),
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 18.5,
        ),
      ),
    );
  }
}
