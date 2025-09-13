import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/routes/routes_names.dart';
import 'Core/constant/app_sizes.dart';
import 'ViewModel/auth_viewmodel.dart';
import 'ViewModel/todo_viewmodel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => todoprovider()),
          ChangeNotifierProvider(create: (_) => AuthViewmodel()),
        ],
        child: MaterialApp(
          title: 'Todo App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesNames.SplashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        )
    );
  }
}
