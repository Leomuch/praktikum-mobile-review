import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review6/dark_mode.dart';
import 'package:review6/screens/task_screen.dart';

import 'models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TaskData(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeModeData(),
        )
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: Provider.of<ThemeModeData>(context).themeMode,
          darkTheme: ThemeData.dark(useMaterial3: true),
          home: const TasksScreen(),
        );
      }),
    );
  }
}
