import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onItemTapped; // Callback to handle item taps
  final int currentIndex; // Track the selected index

  const BottomNavBar({
    required this.onItemTapped,
    required this.currentIndex,
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_rounded),
          label: 'Track Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: 'Profile',
        ),

      ],
      currentIndex: widget.currentIndex, // Highlight the selected item
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      onTap: widget.onItemTapped, // Trigger the callback on tap
    );
  }
}

// Home Page Widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Explore Page Widget
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Explore Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Settings Page Widget
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
