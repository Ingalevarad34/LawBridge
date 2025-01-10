import 'package:flutter/material.dart';

class Lawyeruserchatscreen extends StatelessWidget {
  String name;
  Lawyeruserchatscreen({required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF128C7E), // WhatsApp green
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/tim.png'), // Replace with actual image
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "online",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.call, color: Colors.black), // Voice call icon
            onPressed: () {
              print("Voice call button tapped");
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam,
                color: Colors.black), // Video call icon
            onPressed: () {
              print("Video call button tapped");
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black), // Menu icon
            onPressed: () {
              print("More options button tapped");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                // Sender message bubble
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCF8C6), // Light green
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Hello how are you?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.done_all,
                            color: Color(0xFF34B7F1), size: 16), // Double tick
                      ],
                    ),
                  ),
                ),
                // Another sender message bubble
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCF8C6), // Light green
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "I need assistance regarding a case",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.done_all,
                            color: Color(0xFF34B7F1), size: 16), // Double tick
                      ],
                    ),
                  ),
                ),
                // Receiver message bubble
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECE5DD), // Light gray
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "First of all hello",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                //Another Receiver message bubble
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECE5DD), // Light gray
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "And yahe, how may I help you?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions, color: Colors.grey),
                  onPressed: () {
                    print("Emoji button tapped");
                  },
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {
                    print("Attach button tapped");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.mic, color: Colors.grey),
                  onPressed: () {
                    print("Mic button tapped");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
