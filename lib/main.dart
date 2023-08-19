

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/count_controller.dart';
import 'package:test/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckController()),
      ],
      child:Consumer<CheckController>(
             builder: (context, themeController, Widget? widget) {
              return MaterialApp(
                  title: 'Squares Example',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home: const Main(),
              );
          }
        ),
      );
  }
}

