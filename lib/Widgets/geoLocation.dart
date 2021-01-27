import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loginFirebase/Widgets/services/geolocator_service.dart';
import 'package:provider/provider.dart';

import 'screens/map.dart';



// ignore: camel_case_types
class geoLocation extends StatelessWidget {
  final geoService = GeolocatorService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getInitialLocation(),
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        
        body: Consumer<Position>(
          builder: (context, position, widget) {
            return (position != null)
                ? Mapp(position)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
