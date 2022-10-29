import 'package:flutter/material.dart';
import 'package:flutterdapp/parentModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({Key? key}) : super(key: key);
  @override
  _ParentPageState createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  String locationMessage = "No data yet"; // starting message
  String lat_1 = "0.00"; // starting latitude
  String lon_1 = "0.00"; // starting longitude

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
    var listModel = Provider.of<parentModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Color.fromARGB(255, 151, 3, 236),
                ),
                child: MaterialButton(
                  onPressed: () {
                    // when employer taps view employee location
                    // longitude and latitude is returned
                    listModel.getCoordinates();
                    lat_1 = listModel.latitude;
                    lon_1 = listModel.longitude;
                    setState(() {
                      locationMessage = "Latitude: $lat_1\nLongitude: $lon_1";
                    });
                    Text(locationMessage);
                  },
                  child: Text('View Employee Location',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              listModel.isLoading
                  ? Text(
                      "Employee Last known Location: \nNo data yet",
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Coordinates:\n" + locationMessage,
                      textAlign: TextAlign.center,
                    ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Color.fromARGB(255, 223, 167, 0),
                ),
                child: MaterialButton(
                  // view employee location on Google Maps
                  // use locations from smart contract
                  onPressed: () async {
                    if (lat_1 == "0.00" && lon_1 == "0.00") {
                      showToastMessage("No data yet");
                    }

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
