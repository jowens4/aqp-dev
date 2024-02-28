import 'package:flutter/material.dart';
import 'package:navi_app/login.dart';
import 'package:navi_app/my_app_bar.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';

enum AppScreen { login, home, details, data }

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

class AppRouterDelegate extends RouterDelegate<AppScreen>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppScreen> {
  AppScreen _screen = AppScreen.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('title'),
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              _setNewRoutePath(AppScreen.login);
              //Navigator.pop(context);
            },
            tooltip: 'login',
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _setNewRoutePath(AppScreen.home);
              //Navigator.pop(context);
            },
            tooltip: 'home',
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              _setNewRoutePath(AppScreen.details);
            },
            tooltip: 'details',
          ),
          IconButton(
            icon: Icon(Icons.data_array),
            onPressed: () {
              _setNewRoutePath(AppScreen.data);
            },
            tooltip: "idea",
          ),
        ],
      )),
      drawer: Drawer(),
      body: Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            key: ValueKey('HomeScreen'),
            child: HomeScreen(),
          ),
          if (_screen == AppScreen.login)
            MaterialPage(
              key: ValueKey('LoginScreen'),
              child: LoginScreen(),
            ),
          if (_screen == AppScreen.details)
            MaterialPage(
              key: ValueKey('DetailsScreen'),
              child: DetailScreen(),
            ),
          if (_screen == AppScreen.data)
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

  void _setNewRoutePath(AppScreen configuration) {
    logged = true;
    if (logged) {
      if (_screen != configuration) {
        _screen = configuration;
        notifyListeners();
      }
    } else {
      _screen = AppScreen.login;
      notifyListeners();
    }
  }

  @override
  AppScreen get currentConfiguration => _screen;

  @override
  Future<void> setNewRoutePath(AppScreen configuration) async {
    _setNewRoutePath(configuration);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
}

class AppRouteInformationParser extends RouteInformationParser<AppScreen> {
  @override
  Future<AppScreen> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.uri.path) {
      case 'login':
        return AppScreen.login;
      case '/':
        return AppScreen.home;
      case '/details':
        return AppScreen.details;
      case '/data':
        return AppScreen.data;
      default:
        return AppScreen.home;
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppScreen configuration) {
    switch (configuration) {
      case AppScreen.login:
        return RouteInformation(uri: Uri.parse('/login'));
      case AppScreen.home:
        return RouteInformation(uri: Uri.parse('/'));
      case AppScreen.details:
        return RouteInformation(uri: Uri.parse('/details'));
      case AppScreen.data:
        return RouteInformation(uri: Uri.parse('/data'));
      default:
        return RouteInformation(uri: Uri.parse('/'));
    }
  }
}

// Replace these with your actual screens
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

// Replace these with your actual screens
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Home Screen');
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: AppScreen.values.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.hail),
                            onPressed: () {
                              // /_setNewRoutePath(AppScreen.details);
                            },
                            tooltip: 'details',
                          ),
                          ListTile(
                            title: Text('${AppScreen.values[index]}'),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Placeholder(),
            ],
          ),
        ],
      ),
    );
  }
}

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
