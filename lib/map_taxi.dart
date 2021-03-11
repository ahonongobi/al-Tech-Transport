import 'package:best_flutter_ui_templates/map_taxi_choose.dart';
import 'package:best_flutter_ui_templates/showdraver.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

class MapTaxi extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  @override
  _MapTaxiState createState() => _MapTaxiState();
}

class _MapTaxiState extends State<MapTaxi> {
  PickResult selectedPlace;
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlacePicker(
                        apiKey: "AIzaSyAJecqCyoYXgZcqOK23fjFlb_65DGHWmNw",
                        initialPosition: MapHomePage.kInitialPosition,
                        useCurrentLocation: true,
                        selectInitialPosition: true,

                        //usePlaceDetailSearch: true,
                        onPlacePicked: (result) {
                          selectedPlace = result;
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                        //forceSearchOnZoomChanged: true,
                        //automaticallyImplyAppBarLeading: false,
                        //autocompleteLanguage: "ko",
                        //region: 'au',
                        //selectInitialPosition: true,
                        selectedPlaceWidgetBuilder:
                            (_, selectedPlace, state, isSearchBarFocused) {
                          print(
                              "state: $state, isSearchBarFocused: $isSearchBarFocused");
                          return isSearchBarFocused
                              ? Container()
                              : FloatingCard(
                                  bottomPosition:
                                      0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                  leftPosition: 0.0,
                                  rightPosition: 0.0,
                                  width: 500,
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: state == SearchingState.Searching
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : RaisedButton(
                                          child: Text("Pick Here"),
                                          onPressed: () {
                                            // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                            //            this will override default 'Select here' Button.
                                            print(
                                                "do something with [selectedPlace] data");
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                );
                        },
                        // pinBuilder: (context, state) {
                        //   if (state == PinState.Idle) {
                        //     return Icon(Icons.favorite_border);
                        //   } else {
                        //     return Icon(Icons.favorite);
                        //   }
                        // },
                      );
                    },
                  ),
                );
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
