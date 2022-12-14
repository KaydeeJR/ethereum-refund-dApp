import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterdapp/ParentPage.dart';
import 'package:flutterdapp/parentModel.dart';
import 'package:flutterdapp/childModel.dart';
import 'package:provider/provider.dart';
import 'package:flutterdapp/ChildPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

var password; // stores password value for the session

Future main() async {
  // asynchronous operation
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 6));
}

/* void main() {
//  runApp(const MyApp());
 }*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // list of providers: ChangeNotifierProvider
      // list of children/descendants who will have access to change notifier
      providers: [
        // wrap the widgets with ChangeNotifierProvider widget.
        // creating a change notifier
        ChangeNotifierProvider(
          create: (context) => parentModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => childModel(),
        )
      ],
      child: MaterialApp(
        // description used by the device to identify the app for the user
        title: 'GPS Tracker Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        // must specify starting page
        home: const MyHomePage(title: 'Demo'),
        // whether to show debug banner at corner of device
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

//
//

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _passwordController = TextEditingController();
  int _value =
      1; // stores state selected from drop down widget. default = admin
  String error = ''; // error message for wrong password length

  // app UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "GPS Tracker",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 50,
                color: Color.fromARGB(255, 92, 29, 240),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 10,
              ),
              // ###########################################################################

              child: DropdownButton(
                dropdownColor: Color.fromARGB(255, 8, 255, 140),
                iconEnabledColor: Color.fromARGB(255, 65, 194, 9),
                value: _value, // default selected : admin
                items: [
                  // states to display
                  DropdownMenuItem<int>(
                    child: Text("Admin"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Employee"),
                    value: 2,
                  )
                ],
                // called when user selects state
                onChanged: (value) {
                  setState(() {
                    _value = value as int;
                  });
                },
              ),
              // ###########################################################################
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 10,
              ),
              child: TextFormField(
                // password text box
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
            Text("(Password must be 8 Characters)"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              // login button
              width: MediaQuery.of(context).size.width / 1.3,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: Color.fromARGB(255, 164, 16, 233),
              ),
              child: MaterialButton(
                onPressed: () {
                  // if button tapped
                  if (_passwordController.text.length >= 8) {
                    if (_passwordController.text == "adminadmin") {
                      if (_value == 1) {
                        // display parent page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParentPage(),
                          ),
                        );
                      }
                    } else if (_value == 2) {
                      // display child page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChildPage(),
                        ),
                      );
                    } else {
                      // invalid selection
                      Text("Invalid User");
                    }
                    password = _passwordController.text;
                  } else {
                    // password is too short
                    setState(() {
                      error =
                          "Invalid length: \nPlease input 8 character secret password";
                    });
                  }
                },
                child: const Text('Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red[400]),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
