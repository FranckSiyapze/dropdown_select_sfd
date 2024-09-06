import 'package:dropdown_select_sfd/select.dart';
import 'package:flutter/material.dart';

/// The main function to run the application.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Using a color scheme with a seed color for consistent theming.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// A stateful widget that represents the home page of the app.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  /// The title to display in the app bar.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// The state for [MyHomePage] widget.
class _MyHomePageState extends State<MyHomePage> {
  /// A list of elements to display in the dropdown.
  List<ListElements> elements = [];

  @override
  void initState() {
    super.initState();

    // Initializing the elements for the dropdown selection.
    elements = [
      ListElements(
        "Use my phone number",
        const Icon(
          Icons.phone,
          color: Color(0xFF305083),
          size: 24,
        ),
            () {
          print("Phone tapped");
        },
      ),
      ListElements(
        'Use my email address',
        const Icon(
          Icons.mail,
          color: Color(0xFF305083),
          size: 24,
        ),
            () {
          print("Mail tapped");
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 500,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: DropdownSelectSFD(
            leading: const Icon(
              Icons.settings_suggest,
              color: Color(0xFF305083),
            ),
            color: const Color.fromRGBO(48, 80, 131, 0.54),
            elements: elements,
            labelTextDefault: 'Please select a value',
          ),
        ),
      ),
    );
  }
}
