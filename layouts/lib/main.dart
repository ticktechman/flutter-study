import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Voltaire",
        useMaterial3: true,
      ),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    var dec = BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      //背景装饰
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(221, 33, 33, 33),
          Color.fromARGB(221, 40, 40, 40)
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 23, 23, 23).withOpacity(.5),
          // spreadRadius: 4,
          blurRadius: 2,
          offset: Offset(1, 1),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(fontFamily: "Voltaire", fontSize: 30),
        backgroundColor: Colors.black87,
        elevation: 4,
        shadowColor: Colors.black,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.notifications_sharp),
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.camera)),
        title: const Text("BMW x50"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.directions_bus),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        iconSize: 32,
        selectedFontSize: 20,
        unselectedFontSize: 18,
        onTap: (index) {
          setState(() {
            _selected = index;
            print(index);
          });
        },
        currentIndex: _selected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_enhance),
            label: "CAMERA",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "SETTINGS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "MENU",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "ABOUT",
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        alignment: Alignment.topCenter,
        color: const Color.fromARGB(221, 28, 27, 27),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset("lib/asset/bmw.jpeg"),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Updated from vehicle on 9/20/2003 PM',
                style: TextStyle(
                    color: Colors.white, fontFamily: "Voltaire", fontSize: 16),
              ),
            ),
            Container(
              decoration: dec,
              // color: const Color.fromARGB(221, 28, 27, 27),
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              width: double.infinity,

              child: const Text(
                "YOUR FIRST DREAM CAR 😏",
                style: TextStyle(
                  color: Color.fromARGB(212, 255, 255, 255),
                  fontFamily: "Voltaire",
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
                decoration: dec,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.directions_bike,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.home_repair_service,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.computer,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.media_bluetooth_off,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.directions_walk,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.directions_bus_sharp,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.directions_railway,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.directions_boat,
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                  ],
                )),
            SizedBox(
              height: 8,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Container(
                  decoration: dec.copyWith(),
                  width: 400,
                  height: 210,
                  padding: EdgeInsets.all(20),
                  child: const Column(children: [
                    Text(
                      "HISTORY",
                      style: TextStyle(
                        color: Color.fromARGB(212, 255, 255, 255),
                        fontFamily: "Voltaire",
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Voltaire",
                        fontSize: 18,
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: dec.copyWith(),
                  width: 400,
                  height: 210,
                  padding: EdgeInsets.all(20),
                  child: const Column(children: [
                    Text(
                      "ABOUT US",
                      style: TextStyle(
                        color: Color.fromARGB(212, 255, 255, 255),
                        fontFamily: "Voltaire",
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "The overall idea with shifting type bottom navigation bars is that each item will have a different background color (that contrasts with white), since that color will become the color of the entire navigation bar, when the item is selected",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Voltaire",
                        fontSize: 18,
                      ),
                    )
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
