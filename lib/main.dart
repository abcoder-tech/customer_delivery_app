import 'package:Ab_delivery/Pages/favorite_page.dart';
import 'package:Ab_delivery/Pages/home_page.dart';
import 'package:Ab_delivery/Pages/nav_bar.dart';
import 'package:Ab_delivery/Pages/profile_page.dart';
import 'package:Ab_delivery/Pages/responsive.dart';
import 'package:Ab_delivery/Pages/track_order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  // Initialize screen dimensions
 // ResponsiveVariables.initDimensions();
  runApp(

      const
  MyApp()
  );

}

class MyApp extends StatefulWidget {

  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  // Declare `_selectedIndex` to track the selected tab
  int _selectedIndex = 0;



  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    const FavoritePage(),
    const SettingsPage(),
  ];
  // Callback to handle navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
   // int _selectedIndex = 0;

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
      //  backgroundColor: Colors.black,

        body: SafeArea(

          child:  _pages[_selectedIndex],

        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex, // Pass the selected index
          onItemTapped:_onItemTapped, // Pass the callback
        ),
      ),
    );
  }


  }





