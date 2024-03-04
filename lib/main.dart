import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

import 'package:aqp_dev/login.dart';
import 'package:aqp_dev/dogbones_page.dart';
import 'package:aqp_dev/home.dart';

enum TopLevelModules { login, home, dashboard, dogbones, data }

enum DogboneModules { post, get, view }

enum LoginModules { signin, signup, forgot }

bool logged = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppContent(),
    );
  }
}

class MyAppContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}

class AppRouterDelegate extends RouterDelegate<TopLevelModules>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<TopLevelModules> {
  TopLevelModules _screen = TopLevelModules.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Avid Quality Process'),
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              _setNewRoutePath(TopLevelModules.login);
              //Navigator.pop(context);
            },
            tooltip: 'login',
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _setNewRoutePath(TopLevelModules.home);
              //Navigator.pop(context);
            },
            tooltip: 'home',
          ),
          IconButton(
            icon: Icon(Icons.checklist_rounded),
            onPressed: () {
              _setNewRoutePath(TopLevelModules.dogbones);
            },
            tooltip: 'dogbones',
          ),
          IconButton(
            icon: Icon(Icons.data_array),
            onPressed: () {
              _setNewRoutePath(TopLevelModules.data);
            },
            tooltip: "idea",
          ),
        ],
      )),
      body: Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            key: ValueKey('HomeScreen'),
            child: HomeScreen(),
          ),
          if (_screen == TopLevelModules.login)
            MaterialPage(
              key: ValueKey('LoginScreen'),
              child: LoginScreen(),
            ),
          if (_screen == TopLevelModules.dogbones)
            MaterialPage(
              key: ValueKey('dogbonesScreen'),
              child: DogboneScreen(),
            ),
          if (_screen == TopLevelModules.data)
            MaterialPage(
              key: ValueKey('DataScreen'),
              child: DataScreen(),
            ),
        ],
        onPopPage: (route, result) {
          // Handle pop actions
          return route.didPop(result);
        },
      ),
    );
  }

  void _setNewRoutePath(TopLevelModules configuration) {
    if (logged) {
      if (_screen != configuration) {
        _screen = configuration;
        notifyListeners();
      }
    } else {
      _screen = TopLevelModules.login;
      notifyListeners();
    }
  }

  @override
  TopLevelModules get currentConfiguration => _screen;

  @override
  Future<void> setNewRoutePath(TopLevelModules configuration) async {
    _setNewRoutePath(configuration);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
}

class AppRouteInformationParser
    extends RouteInformationParser<TopLevelModules> {
  @override
  Future<TopLevelModules> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.uri.path) {
      case 'login':
        return TopLevelModules.login;
      case '/':
        return TopLevelModules.home;
      case '/dogbones':
        return TopLevelModules.dogbones;
      case '/data':
        return TopLevelModules.data;
      default:
        return TopLevelModules.home;
    }
  }

  @override
  RouteInformation restoreRouteInformation(TopLevelModules configuration) {
    switch (configuration) {
      case TopLevelModules.login:
        return RouteInformation(uri: Uri.parse('/login'));
      case TopLevelModules.home:
        return RouteInformation(uri: Uri.parse('/'));
      case TopLevelModules.dogbones:
        return RouteInformation(uri: Uri.parse('/dogbones'));
      case TopLevelModules.data:
        return RouteInformation(uri: Uri.parse('/data'));
      default:
        return RouteInformation(uri: Uri.parse('/'));
    }
  }
}

// Replace these with your actual screens

class DataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Data Screen');
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MyApp(),
    ),
  );
}
