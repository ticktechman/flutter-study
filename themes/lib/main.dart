import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

var dark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Voltaire",
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 4,
    shadowColor: Colors.black,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black87,
    brightness: Brightness.dark,
    primary: Colors.white,
    secondary: Colors.white,
    tertiary: Colors.white,
    // tertiary: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  segmentedButtonTheme: SegmentedButtonThemeData(
    style: ButtonStyle(
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      ),
    ),
  ),
);

var light = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Voltaire",
  appBarTheme: AppBarTheme(
    elevation: 4,
    shadowColor: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blue,
    tertiary: Colors.blue,
    // onPrimaryContainer: Colors.black12,
    onSurface: const Color.fromARGB(192, 0, 0, 0),
    onSecondaryContainer: Colors.grey.shade100,
    background: Colors.grey.shade100,
    onBackground: Colors.grey.shade800,
    outline: Colors.grey.shade300,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
  segmentedButtonTheme: SegmentedButtonThemeData(
    style: ButtonStyle(
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      ),
    ),
  ),
  dividerTheme: DividerThemeData(color: Colors.grey.shade300),
  useMaterial3: true,
);

class AppSettings with ChangeNotifier {
  var _theme = ThemeMode.light;
  ThemeMode get theme {
    return _theme;
  }

  set theme(t) {
    _theme = t;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => AppSettings(),
        builder: (context, child) {
          var savedTheme = Provider.of<AppSettings>(context).theme;
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: savedTheme,
            darkTheme: dark,
            theme: light,
            home: const MyHomePage(title: 'DEMO PAGE'),
            debugShowCheckedModeBanner: false,
          );
        },
      );
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
  int _selected = 0;
  Set<ThemeMode> selections = <ThemeMode>{ThemeMode.light};
  bool cbvalue1 = false;
  bool cbvalue2 = false;
  bool allselect = false;

  List<String> partions = ["/", "/home", "/opt", "/root"];
  List<bool> checked = [];
  @override
  void initState() {
    super.initState();
    checked = List<bool>.generate(partions.length, (i) => false);
  }

  @override
  Widget build(BuildContext context) {
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
            style: Theme.of(context).elevatedButtonTheme.style,
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
            ElevatedButton(
              onPressed: () {},
              child: Text('BUTTON'),
            ),
            SizedBox(height: 20),
            LinearPercentIndicator(
              percent: 0.5,
              barRadius: const Radius.circular(2.5),
              progressColor: Colors.blue,
            ),
            Column(
              children: [
                CheckboxListTile(
                  title: Text("ALL"),
                  value: allselect,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (b) {
                    setState(() {
                      allselect = b!;
                      for (var i = 0; i < checked.length; i++) {
                        checked[i] = allselect;
                      }
                    });
                  },
                ),
                Divider(),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    itemCount: partions.length,
                    itemBuilder: (context, idx) {
                      return CheckboxListTile(
                        title: Text(partions[idx]),
                        value: checked[idx],
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (b) {
                          setState(() {
                            checked[idx] = b!;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            DropdownMenu<String>(
              initialSelection: "en",
              onSelected: (str) {
                print(str);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry<String>(
                  value: "en",
                  label: "English",
                ),
                DropdownMenuEntry<String>(
                  value: "zh",
                  label: "简体中文",
                ),
              ],
            ),
            SizedBox(height: 20),
            SegmentedButton<ThemeMode>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment<ThemeMode>(
                  value: ThemeMode.dark,
                  icon: Icon(Icons.dark_mode_outlined),
                  tooltip: 'DARK',
                ),
                ButtonSegment<ThemeMode>(
                  value: ThemeMode.light,
                  icon: Icon(
                    Icons.light_mode_outlined,
                  ),
                  tooltip: 'LIGHT',
                ),
                ButtonSegment<ThemeMode>(
                  value: ThemeMode.system,
                  icon: Icon(Icons.auto_mode),
                  tooltip: 'SYSTEM',
                )
              ],
              selected: selections,
              onSelectionChanged: (newselected) {
                setState(() {
                  selections = newselected;
                });
                var setting = Provider.of<AppSettings>(context, listen: false);
                setting.theme = newselected.first;
              },
              multiSelectionEnabled: false,
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
