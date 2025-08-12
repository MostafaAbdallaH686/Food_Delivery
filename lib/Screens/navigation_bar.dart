import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/checkout_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  final int index;
  const MainNavigation({super.key, this.index = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  final List<String> _titles = ["FoodDelivery", 'Cart', 'Profile'];

  final List<Widget> _screens = [
    HomeScreen(),
    CheckoutScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading:
            (_currentIndex == 1 || _currentIndex == 2)
                ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => setState(() => _currentIndex = 0),
                )
                : const SizedBox(width: kToolbarHeight),
        actions:
            (_currentIndex == 0)
                ? [
                  IconButton(
                    onPressed: () => setState(() => _currentIndex = 1),
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ]
                : [],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
