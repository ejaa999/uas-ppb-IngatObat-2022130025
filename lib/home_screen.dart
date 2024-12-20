import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingat_obatku/list_obat_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ingat_obatku/reminder_page.dart';
import 'package:ingat_obatku/setting_page.dart';

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
              await _handleLogout(context);
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
              _buildProfilePicture(),
              const SizedBox(height: 16),
              Text(
                "Hello, ${user.displayName ?? "User"}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Email: ${user.email ?? "Unknown"}"),
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
                  label: "Medication List",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReminderPage()),
                    );
                  },
                ),
                _buildMenuButton(
                  icon: Icons.settings,
                  label: "Settings",
                  onTap: () {
                    // TODO: Implement navigation to Settings page
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //       content: Text("Settings page is under development")),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the user's profile picture or a default icon
  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: user.photoURL != null
          ? CachedNetworkImageProvider(user.photoURL!)
          : null,
      child: user.photoURL == null ? const Icon(Icons.person, size: 50) : null,
    );
  }

  /// Helper to build individual buttons in the bottom navigation
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

  /// Handles the logout process and navigates to the login screen
  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: $error")),
      );
    }
  }
}
