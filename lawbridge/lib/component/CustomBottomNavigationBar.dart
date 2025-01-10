import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawbridge/pages/ChatScreen.dart';
import 'package:lawbridge/pages/Home.dart';
import 'package:lawbridge/pages/LoginScreen.dart';
import 'package:lawbridge/pages/PostScreen.dart';
import 'package:lawbridge/pages/ProfileScreen.dart';
import 'package:lawbridge/pages/SignUpScreenForUser.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 213, 234, 255),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      onTap: (index) {
        switch (index) {
          case 0:
            // Navigate to Home
            Get.to(() => HomeScreen(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 800));
            break;
          case 1:
            // Navigate to Search
            Get.to(() => Postscreen(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 800));
            break;
          case 2:
            // Navigate to Chat
            Get.to(() => ChatScreen(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 800));
            break;
          case 3:
            // Navigate to Profile
            Get.to(() => ProfileScreen(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 800));
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
