import 'package:best_flutter_ui_templates/map_taxi_choose.dart';
import 'package:best_flutter_ui_templates/showdraver.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTaxi extends StatefulWidget {
  @override
  _MapTaxiState createState() => _MapTaxiState();
}

class _MapTaxiState extends State<MapTaxi> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;
  Widget getAppBar() {
    return Positioned(
        top: 50,
        left: 50,
        child: Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF008C27),
        ));
  }

  @override
  void initState() {
    getAppBar();
    // TODO: implement initState
    super.initState();
    setCustuMarker();
  }

  void setCustuMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/destinationMapMarker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    getAppBar();
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('id-1'),
        icon: mapMarker,
        position: LatLng(22.5448111, 88.3403691),
        infoWindow: InfoWindow(
          title: "Gobi abyssinie",
          snippet: "Analyste",
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new ShowdraverScreen()));
          },
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(22.5448111, 88.3403691),
          zoom: 15,
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF008C27),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: FloatingActionButton.extended(
              backgroundColor: Color(0xFF008C27),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new MapHomePage()));
              },
              label: Text("EMPLACEMENT DE DEPART"),
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
