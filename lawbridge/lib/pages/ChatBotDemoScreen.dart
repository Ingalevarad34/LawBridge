import 'package:flutter/material.dart';

class ChatBotDemoScreen extends StatelessWidget {
  final List<String> demoQuestions = [
    "What are my legal rights?",
    "How can I file a complaint?",
    "What is the process for starting a business?",
    "Can you help with property disputes?",
    "What is the fee structure for your services?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Legal Chatbot',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildBotMessage("Hello! I’m your AI Legal Assistant. How can I help you today?"),
                const SizedBox(height: 10),
                ...demoQuestions.map((question) {
                  return GestureDetector(
                    onTap: () {
                      _handleDemoQuestion(context, question);
                    },
                    child: _buildDemoQuestionTile(question),
                  );
                }).toList(),
              ],
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildBotMessage(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.smart_toy, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(message, style: const TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoQuestionTile(String question) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade100),
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade50,
        ),
        child: Row(
          children: [
            const Icon(Icons.question_answer, color: Colors.blue),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                question,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type your message...",
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _handleDemoQuestion(BuildContext context, String question) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Bot Response"),
          content: Text("You selected: $question\n\nThis is a demo response to simulate chatbot functionality."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
