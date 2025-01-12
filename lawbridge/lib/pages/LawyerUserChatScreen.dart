import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:lawbridge/pages/VideoScreen.dart';

class Lawyeruserchatscreen extends StatelessWidget {
  String name;

  Lawyeruserchatscreen({required this.name});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => BottomSheetContent(),
    );
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoCallScreen()),
              );
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
                    _showBottomSheet(context);
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

//Bottom sheet

// class HomePage extends StatelessWidget {
//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => BottomSheetContent(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WhatsApp Bottom Sheet'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => _showBottomSheet(context),
//           child: Text('Open Bottom Sheet'),
//         ),
//       ),
//     );
//   }
// }

class BottomSheetContent extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.insert_drive_file,
      'label': 'Document',
      'action': 'document'
    },
    {'icon': Icons.camera_alt, 'label': 'Camera', 'action': 'camera'},
    {'icon': Icons.photo, 'label': 'Gallery', 'action': 'gallery'},
    {'icon': Icons.audiotrack, 'label': 'Audio', 'action': 'audio'},
    {'icon': Icons.location_on, 'label': 'Location', 'action': 'location'},
    {'icon': Icons.payment, 'label': 'Payments', 'action': 'payments'},
    {'icon': Icons.person, 'label': 'Contact', 'action': 'contact'},
  ];

  Future<void> _pickDocument(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null) {
        final file = result.files.first;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected file: ${file.name}')),
        );
      } else {
        // User canceled the picker
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File picking canceled')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking file: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        children: items.map((item) {
          return GestureDetector(
            onTap: () {
              if (item['action'] == 'document') {
                _pickDocument(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.teal.withOpacity(0.1),
                    child: Icon(item['icon'], color: Colors.teal, size: 30),
                  ),
                  SizedBox(height: 8),
                  Text(item['label'], style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
