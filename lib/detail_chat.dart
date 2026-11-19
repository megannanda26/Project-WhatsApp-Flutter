import 'package:flutter/material.dart';

class Message {
  final String chat;
  final bool isMe;

  Message({
    required this.chat,
    required this.isMe,
  });
}

class DetailChat extends StatefulWidget {
  const DetailChat({super.key});

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  final TextEditingController textPesan = TextEditingController();

  final List<Message> _pesan = [
    Message(chat: 'HI!', isMe: true),
    Message(chat: 'Hi juga!', isMe: false),
  ];

  void kirimPesan() {
    final chat = textPesan.text.trim();
    if (chat.isEmpty) {
      return;
    }

    setState(() {
      _pesan.add(Message(chat: chat, isMe: true));
    });

    textPesan.clear();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _pesan.add(Message(chat: 'iyah kenafah', isMe: false));
      });
    });
  }

  @override
  void dispose() {
    textPesan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 12),
            Text("Aji"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(25),
              itemCount: _pesan.length,
              itemBuilder: (context, index) {
                final psn = _pesan[index];
                return Align(
                  alignment: psn.isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(psn.chat),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: textPesan,
                  decoration: InputDecoration(
                    hintText: 'Ketik pesan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  )
                  )),
                IconButton(
                  onPressed: kirimPesan,
                  icon: const Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
