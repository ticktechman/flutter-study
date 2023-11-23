import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

var dummy_route = GoRoute(path: 'dummy', builder: (context, state) => Column());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MyHomePage(title: 'hello', navshell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: [
              GoRoute(
                path: '/a',
                routes: [dummy_route],
                builder: (context, state) {
                  return Column(children: [Text("A page"), Container(height: 100, color: Colors.amber)]);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/b',
                routes: [dummy_route],
                builder: (context, state) {
                  return Column(children: [Text("B page"), Container(height: 100, color: Colors.blue)]);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/c',
                routes: [dummy_route],
                builder: (context, state) {
                  return Column(children: [Text("C page"), Container(height: 100, color: Colors.purple)]);
                },
              ),
            ],
          )
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Voltaire",
        listTileTheme: ListTileThemeData(
          selectedColor: Colors.deepPurple,
          selectedTileColor: Colors.deepPurple.shade50,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, required this.navshell, Key? key})
      : super(key: key ?? const ValueKey<String>('MyHomePage'));

  final String title;
  final StatefulNavigationShell navshell;

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text("HELLO"),
        elevation: 1,
        shadowColor: Colors.grey,
      ),
      includeBaseDestinationsInMenu: true,
      body: navshell,
      selectedIndex: navshell.currentIndex,
      destinations: const [
        AdaptiveScaffoldDestination(title: 'HOME', icon: Icons.home),
        AdaptiveScaffoldDestination(title: 'ALARM', icon: Icons.alarm),
        AdaptiveScaffoldDestination(title: 'ABOUT', icon: Icons.info),
      ],
      onDestinationSelected: (idx) {
        navshell.goBranch(idx);
      },
    );
  }
}
