import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD93025)),
        useMaterial3: true,
      ),
      home: const GmailHomePage(),
    );
  }
}

class GmailHomePage extends StatefulWidget {
  const GmailHomePage({super.key});

  @override
  State<GmailHomePage> createState() => _GmailHomePageState();
}

class _GmailHomePageState extends State<GmailHomePage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _emails = [
    {
      'sender': 'Sender 0',
      'subject': 'Email Subject 0',
      'preview': 'Preview of email content...',
      'time': '9:30 AM',
      'color': Colors.red,
      'initial': 'A'
    },
    {
      'sender': 'Sender 1',
      'subject': 'Email Subject 1',
      'preview': 'Preview of email content...',
      'time': '10:30 AM',
      'color': Colors.pink,
      'initial': 'B'
    },
    {
      'sender': 'Sender 2',
      'subject': 'Email Subject 2',
      'preview': 'Preview of email content...',
      'time': '11:30 AM',
      'color': Colors.purple,
      'initial': 'C'
    },
    {
      'sender': 'Sender 3',
      'subject': 'Email Subject 3',
      'preview': 'Preview of email content...',
      'time': '12:30 AM',
      'color': Colors.deepPurple,
      'initial': 'D'
    },
    {
      'sender': 'Sender 4',
      'subject': 'Email Subject 4',
      'preview': 'Preview of email content...',
      'time': '13:30 AM',
      'color': Colors.indigo,
      'initial': 'E'
    },
    {
      'sender': 'Sender 5',
      'subject': 'Email Subject 5',
      'preview': 'Preview of email content...',
      'time': '14:30 AM',
      'color': Colors.blue,
      'initial': 'F'
    },
    {
      'sender': 'Sender 6',
      'subject': 'Email Subject 6',
      'preview': 'Preview of email content...',
      'time': '15:30 AM',
      'color': Colors.lightBlue,
      'initial': 'G'
    },
    {
      'sender': 'Sender 7',
      'subject': 'Email Subject 7',
      'preview': 'Preview of email content...',
      'time': '16:30 AM',
      'color': Colors.cyan,
      'initial': 'H'
    },
    {
      'sender': 'Sender 8',
      'subject': 'Email Subject 8',
      'preview': 'Preview of email content...',
      'time': '17:30 AM',
      'color': Colors.teal,
      'initial': 'I'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD93025),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD93025),
        leading: const Icon(Icons.menu, color: Colors.white),
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search in mail',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              )
            : const Text(
                'Search in mail',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            color: Colors.white,
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Scaffold(
        body: ListView.builder(
          itemCount: _emails.length,
          itemBuilder: (context, index) {
            final email = _emails[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: email['color'],
                child: Text(
                  email['initial'],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    email['sender'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email['time'],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    email['subject'],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    email['preview'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              trailing: const Icon(Icons.star_border),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Mail',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              label: 'Meet',
            ),
          ],
          selectedItemColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(Icons.edit, color: Colors.red),
        ),
      ),
    );
  }
}