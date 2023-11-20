import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var dark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Voltaire",
  appBarTheme: AppBarTheme(
    elevation: 4,
    shadowColor: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.grey[900]!,
    primary: Colors.white10!,
    secondary: Colors.lightBlueAccent!,
  ),
);

var light = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Voltaire",
  appBarTheme: AppBarTheme(
    // backgroundColor: Colors.lightBlueAccent,
    elevation: 4,
    shadowColor: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
  ),
  useMaterial3: true,
);

var curTheme = ThemeMode.system;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: curTheme,
      darkTheme: dark,
      theme: light,
      home: const MyHomePage(title: 'DEMO PAGE'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selected = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: DrawerButton(
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.deepPurpleAccent,
        iconSize: 32,
        // unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: (idx) {
          setState(() {
            _selected = idx;
            if (_selected % 2 == 0) {
              curTheme = ThemeMode.dark;
            } else {
              curTheme = ThemeMode.light;
            }
          });
        },
        selectedFontSize: 19,
        unselectedFontSize: 16,
        currentIndex: _selected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "AIR"),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: "CAR"),
          BottomNavigationBarItem(icon: Icon(Icons.house), label: "HOUSE"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "CLOUD"),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
