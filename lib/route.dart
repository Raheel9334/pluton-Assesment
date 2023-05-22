import 'package:flutter/material.dart';
import 'package:testpluton/Features/Home/home_screen.dart';

import 'Custom_Widgets/custom_bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // case BottomAppBar.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const AuthScreen(),
    //   );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

    // case ChatroomScreen.routeName:
    //   var receiver = routeSettings.arguments as ChatModel;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ChatroomScreen(
    //       receiver: receiver,
    //     ),
    //   );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Page not found!'),
          ),
        ),
      );
  }
}