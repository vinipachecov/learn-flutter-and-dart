import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:places_app/helper/location_helper.dart';

class LocationInput extends StatefulWidget {
  LocationInput({Key key}) : super(key: key);

  @override
  LocationInputState createState() => LocationInputState();
}

class LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print("location helper!");
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: locData.latitude, longitude: locData.longitude);
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: _previewImageUrl == null
                ? Text('No location Chosen', textAlign: TextAlign.center)
                : Image.network(
                    _previewImageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
                icon: Icon(Icons.location_on),
                label: Text('Current location'),
                textColor: Theme.of(context).primaryColor,
                onPressed: _getCurrentUserLocation),
            FlatButton.icon(
                icon: Icon(Icons.map),
                label: Text('Select on Map'),
                textColor: Theme.of(context).primaryColor,
                onPressed: () {})
          ],
        )
      ],
    );
  }
}