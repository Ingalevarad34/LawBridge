import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/titus.png', // Replace with actual avatar image
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/titus.png', // Replace with actual profile picture
            ),
          ),
          SizedBox(height: 12),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'John90@gmail.com',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE8F1FE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            icon: Icon(Icons.edit, color: Colors.black),
            label: Text(
              'Edit',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildProfileOption(
                  icon: Icons.bookmark,
                  title: 'Save',
                ),
                _buildProfileOption(
                  icon: Icons.notifications,
                  title: 'Notification',
                ),
                _buildProfileOption(
                  icon: Icons.settings,
                  title: 'Setting',
                ),
                _buildProfileOption(
                  icon: Icons.info,
                  title: 'Account Information',
                ),
                _buildProfileOption(
                  icon: Icons.logout,
                  title: 'Log Out',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE8F1FE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
