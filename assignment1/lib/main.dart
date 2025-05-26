import 'package:assignment1/views/live_chat.dart';
import 'package:assignment1/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Ubuntu",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        tabBarTheme: TabBarThemeData(
          dividerColor: Colors.transparent,
          indicatorColor: Colors.white,
          labelColor: Colors.white
        )
      ),
      home: Material(
        color: Colors.black87,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white
          ),
          child: SafeArea(
            // child: ContactWrapper()
            child: LiveChat(),
          )
        )
      )
    );
  }
}