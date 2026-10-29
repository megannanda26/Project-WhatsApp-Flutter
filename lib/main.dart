import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'WhatsApp'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.circle_outlined)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    print("Chat ditekan");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailChat(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 30,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        "Aji",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Hai, apa kabar?"),
                      trailing: Text("12.30"),
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.add, size: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    "Status Saya",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Ketuk untuk menambahkan pembaruan status"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Pembaruan terkini',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  title: Text(
                    "Aji",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Hari ini, 08.20"),
                ),
              ],
            ),

            ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    "Fathir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.call_received, color: Colors.red, size: 16),
                      SizedBox(width: 4),
                      Text("Kemarin, 21.45"),
                    ],
                  ),
                  trailing: Icon(Icons.call, color: Colors.green),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    "Aji",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.call_made, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Text("Hari ini, 11.00"),
                    ],
                  ),
                  trailing: Icon(Icons.videocam, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailChat extends StatelessWidget {
  const DetailChat({super.key});

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
            child: ListView(
              padding: EdgeInsets.all(25),
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("Hai!"),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text("Hai Juga!"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Expanded(child: TextField()),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
