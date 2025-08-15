import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/routes/routes_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    debugShowCheckedModeBanner: false,
    initialRoute: RoutesNames.SplashScreen,
    onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

