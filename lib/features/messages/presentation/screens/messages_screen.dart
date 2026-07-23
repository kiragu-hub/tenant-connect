import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        "name": "John Mwangi",
        "message": "Is the apartment still available?",
        "time": "9:45 AM",
        "unread": true,
      },
      {
        "name": "Grace Wanjiku",
        "message": "Thank you for the payment confirmation.",
        "time": "Yesterday",
        "unread": false,
      },
      {
        "name": "Brian Kariuki",
        "message": "I'll visit the house tomorrow.",
        "time": "Mon",
        "unread": true,
      },
      {
        "name": "Sarah Njeri",
        "message": "Received. Thanks!",
        "time": "Sun",
        "unread": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final chat = messages[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                chat["name"].toString()[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              chat["name"].toString(),
              style: TextStyle(
                fontWeight: chat["unread"] as bool
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              chat["message"].toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: chat["unread"] as bool
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(chat["time"].toString()),
                const SizedBox(height: 5),
                if (chat["unread"] as bool)
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  )
                else
                  const Icon(
                    Icons.done_all,
                    color: Colors.green,
                    size: 18,
                  ),
              ],
            ),
            onTap: () {
              // Open chat screen
            },
          );
        },
      ),
    );
  }
}