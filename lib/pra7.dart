import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: RegApp()));

class RegApp extends StatefulWidget { const RegApp({super.key}); @override State<RegApp> createState() => _RegApp(); }

class _RegApp extends State<RegApp> {
  // Just two controllers: Name (n) and Email (e)
  final n = TextEditingController(), e = TextEditingController();
  List<String> users = []; // Our simple database

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Simple Registration')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      TextField(controller: n, decoration: const InputDecoration(hintText: 'Name')),
      TextField(controller: e, decoration: const InputDecoration(hintText: 'Email')), // obscureText removed
      const SizedBox(height: 20),
      
      // Register Button
      ElevatedButton(
        onPressed: () => setState(() {
          users.add("${n.text} | Email: ${e.text}"); // Save
          n.clear(); e.clear(); // Clear boxes
        }),
        child: const Text('Register')
      ),
      
      const Divider(thickness: 2),
      const Text('Registered Users:', style: TextStyle(fontWeight: FontWeight.bold)),
      
      // Display stored users
      ...users.map((user) => Padding(padding: const EdgeInsets.all(4.0), child: Text(user)))
    ])
  );
}