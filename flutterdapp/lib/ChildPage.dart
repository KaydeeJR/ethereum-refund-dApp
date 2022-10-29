import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:flutterdapp/childModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChildPage extends StatefulWidget {
  // EMPLOYEE DEVICE PAGE
  const ChildPage({Key? key}) : super(key: key);
  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  var locationMessage =
      ""; // stores previous location to be displayed on screen
  String lat_1 = "0.00"; // start lat
  String lon_1 = "0.00"; // start long
  String status = "Not sending location data"; // update location status
  bool isSwitched = false; // state of track location switch widget
  //int i = 0;

  // variable will be initialised later. using streams to fetch location data
  // a function will be called everytime a stream emits an event
  late StreamSubscription<Position> positionStream;

  void stopUpdate() {
    // stop fetching location data from Geolocator
    positionStream.cancel();
    locationMessage = "Unknown location";
    status = "Not sending location data";
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  // UI design
  @override
  Widget build(BuildContext context) {
    // accessing data provider for this class
    var listModel = Provider.of<childModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Location"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 46.0,
                color: Color.fromARGB(255, 149, 33, 243),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Get Location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(locationMessage.length == 0
                  ? "Unknown Location. Please tap Get Current Location"
                  : "Last known location: \n" + locationMessage),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Color.fromARGB(255, 205, 7, 255),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    // when employee taps get current location
                    if (isSwitched) {
                      // check if track location is ON
                      // fetch their current location with highest possible accuracy
                      var position = await Geolocator().getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);
                      var lat = position.latitude;
                      var lon = position.longitude;
                      lat_1 = lat.toString();
                      lon_1 = lon.toString();
                      setState(() {
                        locationMessage = "Latitude: $lat_1\nLongitude: $lon_1";
                      });
                      showToastMessage(
                          "Not Encrypted: \nLatitude: $lat, Longitude: $lon");
                    } else {
                      showToastMessage("Please turn on track location");
                    }
                  },
                  child: Text('Get Current Location',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Track Location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Switch(
                // state of switch box is determined by the boolean value
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    if (value) {
                      // instantiate the Geolocator plugin
                      var geolocator = Geolocator();
                      var locationOptions = LocationOptions(
                        accuracy: LocationAccuracy.high,
                        // changed distance filter from 100 to 10
                        distanceFilter: 10,
                      );
                      positionStream =
                          geolocator.getPositionStream(locationOptions).listen(
                        (Position position) {
                          setState(
                            () {
                              // switch is on
                              showToastMessage("Tracking On");
                              value = true;
                              isSwitched = true;
                              lat_1 = position.latitude.toString();
                              lon_1 = position.longitude.toString();
                              listModel.addCoordinates(
                                lat_1,
                                lon_1,
                              );
                              status =
                                  "Sending location : Latitude: $lat_1\nLongitude: $lon_1";
                              locationMessage =
                                  "Latitude: $lat_1\nLongitude: $lon_1";
                            },
                          );
                        },
                      );
                    } else {
                      showToastMessage("Tracking Off");
                      value = false;
                      isSwitched = false;
                      stopUpdate();
                    }
                  });
                },
                activeTrackColor: Color.fromARGB(255, 189, 7, 7),
                activeColor: Color.fromARGB(255, 226, 11, 11),
              ),
              SizedBox(
                height: 20.0,
              ),
              listModel.isLoading
                  ? Text("Not sending location data")
                  : Text(status),
              SizedBox(
                height: 100.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Color.fromARGB(255, 35, 196, 20),
                ),
                child: MaterialButton(
                  // open Google maps and view current location
                  onPressed: () async {
                    final String googleMapsUrl =
                        "https://www.google.com/maps/search/?api=1&query=$lat_1,$lon_1";
                    final String appleMapsUrl =
                        "https://maps.apple.com/?q=$lat_1,$lon_1";

                    if (await canLaunchUrlString(googleMapsUrl)) {
                      await launchUrlString(googleMapsUrl);
                    }
                    if (await canLaunchUrlString(appleMapsUrl)) {
                      await launchUrlString(appleMapsUrl);
                    } else {
                      showToastMessage("Something went wrong");
                      throw "Couldn't Open Maps";
                    }
                  },
                  child: Text('View in Maps',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}
