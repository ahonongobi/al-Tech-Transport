import 'package:best_flutter_ui_templates/showdraver.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mappages extends StatefulWidget {
  @override
  _MappagesState createState() => _MappagesState();
}

class _MappagesState extends State<Mappages> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustuMarker();
  }

  void setCustuMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/destinationMapMarker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
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
      appBar: AppBar(
        title: Text("Bénin Taxi proche"),
        backgroundColor: Color(0xFFED2839),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(22.5448111, 88.3403691),
          zoom: 15,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new ShowdraverScreen()));
          },
          tooltip: "Rechercher",
          backgroundColor: Color(0xFFED2839),
          hoverColor: Colors.redAccent,
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
