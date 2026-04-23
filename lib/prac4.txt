import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: App()));

class App extends StatefulWidget { const App({super.key}); @override State<App> createState() => _App(); }

class _App extends State<App> {
  // c[0]=Name, c[1]=Pass, c[2]=Addr, c[3]=Age
  final c = List.generate(4, (_) => TextEditingController()); 
  String g = 'M', s = 'MH', d = 'DOB', out = '';

  @override
  Widget build(BuildContext context) => Scaffold(body: ListView(children: [
    TextField(controller: c[0], decoration: const InputDecoration(hintText: 'Name')),
    TextField(controller: c[1], decoration: const InputDecoration(hintText: 'Password')),
    TextField(controller: c[2], decoration: const InputDecoration(hintText: 'Address')),
    TextField(controller: c[3], decoration: const InputDecoration(hintText: 'Age')),
    
    // Gender Radio Buttons (squashed into one row)
    Row(children: [Radio(value: 'M', groupValue: g, onChanged: (v) => setState(()=>g=v!)), const Text('Male'), Radio(value: 'F', groupValue: g, onChanged: (v) => setState(()=>g=v!)), const Text('Female')]),
    
    // Date Picker
    ElevatedButton(onPressed: () async { var dt = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now()); if(dt!=null) setState(()=>d="${dt.day}/${dt.month}/${dt.year}");}, child: Text(d)),
    
    // State Dropdown
    DropdownButton(value: s, items: ['MH', 'DL', 'GJ'].map((x) => DropdownMenuItem(value: x, child: Text(x))).toList(), onChanged: (v) => setState(()=>s=v!)),
    
    // Submit & Print
    ElevatedButton(onPressed: () => setState(() => out = "${c[0].text} | ${c[1].text} | ${c[2].text} | ${c[3].text} | $g | $d | $s"), child: const Text('Submit')),
    Text(out, style: const TextStyle(fontSize: 18))
  ]));
}