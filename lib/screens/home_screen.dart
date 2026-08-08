import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Pages for Bottom Navigation Bar
    final List<Widget> pages = [
      // Tab 0: Dashboard (GridView)
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            ProductCard(
              title: "Week 1 Completed",
              subtitle: "UI & Auth Setup",
              icon: Icons.check_circle,
              onTap: () {},
            ),
            ProductCard(
              title: "Week 2 Active",
              subtitle: "Navigation & Widgets",
              icon: Icons.widgets,
              onTap: () {},
            ),
            ProductCard(
              title: "State Management",
              subtitle: "Upcoming Tasks",
              icon: Icons.settings_suggest,
              onTap: () {},
            ),
            ProductCard(
              title: "GitHub Repo",
              subtitle: "Successfully Pushed",
              icon: Icons.code,
              onTap: () {},
            ),
          ],
        ),
      ),

      // Tab 1: Products (ListView)
      ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.indigo, size: 40),
              title: Text("Flutter UI Masterclass", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Complete layout and widget guide"),
              trailing: Text("\$49.00", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.code, color: Colors.indigo, size: 40),
              title: Text("Clean Architecture Guide", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Reusable widgets & folder structure"),
              trailing: Text("\$29.00", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),

      // Tab 2: Profile Page
      Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.indigo.shade100,
                child: Icon(Icons.person, size: 60, color: Colors.indigo.shade700),
              ),
              const SizedBox(height: 16),
              const Text(
                "Mahnoor Fatima",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "BSIT 6th Semester Student\nBackend & AI Developer",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade50,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text("Log Out"),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? "Dashboard" : _currentIndex == 1 ? "Products" : "Profile",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo.shade700,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Products"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}