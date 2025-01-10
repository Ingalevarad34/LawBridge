import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawbridge/component/CustomBottomNavigationBar.dart';
import 'package:lawbridge/pages/LawyerUserChatScreen.dart';

class ChatScreen extends StatelessWidget {
  final List chats = [
    {
      'name': 'John',
      'message': 'And yahe, how may I help you?',
      'time': '12:35 PM',
      'unreadCount': 2,
      'image': 'assets/tim.png',
    },
    {
      'name': 'Jane',
      'message': 'What kind of strategy is better?',
      'time': '11:55 AM',
      'image': 'assets/titus.png',
    },
    {
      'name': 'Michael',
      'message': '🎤 0:14',
      'time': 'Yesterday',
      'image': 'assets/soul.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF128C7E),
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return InkWell(
            onTap: () {
              Get.to(
                  () => Lawyeruserchatscreen(
                        name: chat['name'],
                      ),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 800));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: chat['image'] != null
                        ? AssetImage(chat['image'])
                        : AssetImage('assets/titus.png') as ImageProvider,
                    backgroundColor: Colors.grey[200],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat['name'] ?? 'Unknown',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          chat['message'] ?? 'No message available',
                          style: TextStyle(color: Colors.grey[700]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chat['time'] ?? '',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      if (chat['unreadCount'] != null)
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Color(0xFF25D366),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            chat['unreadCount'].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
