import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingat_obatku/list_obat_screen.dart';


class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header with user information
          Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    user.photoURL != null ? NetworkImage(user.photoURL!) : null,
                child: user.photoURL == null
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 16),
              Text(
                "Hello, ${user.displayName ?? "User"}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Email: ${user.email}"),
            ],
          ),

          // Bottom navigation buttons
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton(
                  icon: Icons.medication,
                  label: "List Obat",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ListObatScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuButton(
                  icon: Icons.alarm,
                  label: "Reminder",
                  onTap: () {
                    // Navigate to Reminder page
                  },
                ),
                _buildMenuButton(
                  icon: Icons.settings,
                  label: "Settings",
                  onTap: () {
                    // Navigate to Settings page
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build individual buttons
  Widget _buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, size: 30, color: Colors.blue),
          onPressed: onTap,
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
