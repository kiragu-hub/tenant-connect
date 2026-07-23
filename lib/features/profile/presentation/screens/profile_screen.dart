import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Landlord Profile"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Profile Picture
              // Profile Picture
Container(
  padding: const EdgeInsets.all(4),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.blue,
      width: 3,
    ),
  ),
  child: const CircleAvatar(
    radius: 60,
    backgroundImage: AssetImage('assets/profile.jpg'),
  ),
),

const SizedBox(height: 20),

              // Name
              const Text(
                "Joseph Kiragu",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // Role
              const Text(
                "Landlord",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              // Email
              const Text(
                "joseph@example.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildTile(
                      icon: Icons.person_outline,
                      title: "Edit Profile",
                    ),
                    const Divider(height: 1),

                    _buildTile(
                      icon: Icons.home_work_outlined,
                      title: "My Properties",
                    ),
                    const Divider(height: 1),

                    _buildTile(
                      icon: Icons.favorite_border,
                      title: "Saved Properties",
                    ),
                    const Divider(height: 1),

                    _buildTile(
                      icon: Icons.notifications_none,
                      title: "Notifications",
                    ),
                    const Divider(height: 1),

                    _buildTile(
                      icon: Icons.lock_outline,
                      title: "Change Password",
                    ),
                    const Divider(height: 1),

                    _buildTile(
                      icon: Icons.help_outline,
                      title: "Help & Support",
                    ),
                    const Divider(height: 1),

                    _buildTile(
                      icon: Icons.settings,
                      title: "Settings",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logout code here
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildTile({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}