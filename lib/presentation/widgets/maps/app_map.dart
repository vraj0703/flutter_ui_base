import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AppMap extends StatelessWidget {
  final String baseUrl;
  final double lat;
  final double long;

  const AppMap({
    super.key,
    required this.baseUrl,
    required this.lat,
    required this.long,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(initialCenter: LatLng(lat, long), minZoom: 13.0),
      children: [TileLayer(urlTemplate: baseUrl)],
    );
  }
}
