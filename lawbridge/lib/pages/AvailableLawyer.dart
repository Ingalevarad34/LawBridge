import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawbridge/pages/LawyerProfileScreen.dart';

class AvailableLawyerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lawyers',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Lawyer List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for topics',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Replace with your dynamic count
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => LawyerProfileScreen(),
                          transition: Transition.downToUp,
                          duration: const Duration(milliseconds: 800));
                    },
                    child: LawyerTile(
                      name: index == 0
                          ? 'Titus Cooray'
                          : index == 1
                              ? 'Laura Tim'
                              : 'Soul Goodman',
                      position: index == 0 || index == 2 ? 'Senior' : 'Junior',
                      status: index == 0 ? 'Online' : 'Offline',
                      isOnline: index == 0,
                      imageAsset: index == 0
                          ? 'assets/tim.png'
                          : index == 1
                              ? 'assets/titus.png'
                              : 'assets/soul.png',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LawyerTile extends StatelessWidget {
  final String name;
  final String position;
  final String status;
  final bool isOnline;
  final String imageAsset;

  const LawyerTile({
    required this.name,
    required this.position,
    required this.status,
    required this.isOnline,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imageAsset,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(position),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              status,
              style: TextStyle(
                color: isOnline ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.circle,
              color: isOnline ? Colors.green : Colors.red,
              size: 10,
            ),
          ],
        ),
      ),
    );
  }
}
