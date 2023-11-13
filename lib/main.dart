import 'login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

// Root of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch : const MaterialColor(0xFF004CBF, {
          50: Color(0xFF004CBF),
          100: Color(0xFF004CBF),
          200: Color(0xFF004CBF),
          300: Color(0xFF004CBF),
          400: Color(0xFF004CBF),
          500: Color(0xFF004CBF),
          600: Color(0xFF004CBF),
          700: Color(0xFF004CBF),
          800: Color(0xFF004CBF),
          900: Color(0xFF004CBF),
        }),

        primaryColor: const Color(0xFF0028A8),
      ),
      home: Login(),

      // To use the gradient color for the image
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff022AAB),
                Color(0xff2452E1),
              ],
            ),
          ),
          child: child,
        );
      },
    );
  }
}
