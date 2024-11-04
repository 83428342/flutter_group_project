import 'package:flutter/material.dart';
import 'ManualScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EditMainScreen(), // 초기 화면을 EditMainScreen으로 설정
    );
  }
}

class EditMainScreen extends StatefulWidget {
  const EditMainScreen({Key? key}) : super(key: key);

  @override
  _EditMainScreenState createState() => _EditMainScreenState();
}

class _EditMainScreenState extends State<EditMainScreen> {
  int _currentIndex = 0;
  final List<Map<String, String>> _items = List.generate(
    6,
        (index) => {
      'name': 'Name $index',
      'lastMessage': 'Last Message $index',
    },
  );
  final List<int> _selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Main Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedIndices.contains(index)) {
                        _selectedIndices.remove(index);
                      } else {
                        _selectedIndices.add(index);
                      }
                    });
                  },
                  child: Container(
                    color: _selectedIndices.contains(index) ? Colors.black12 : null,
                    child: ListTile(
                      leading: const CircleAvatar(child: Text('PIC')),
                      title: Text(_items[index]['name']!),
                      subtitle: Text(_items[index]['lastMessage']!),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _selectedIndices.isNotEmpty
                  ? () {
                setState(() {
                  _selectedIndices.sort();
                  for (int i = _selectedIndices.length - 1; i >= 0; i--) {
                    _items.removeAt(_selectedIndices[i]);
                  }
                  _selectedIndices.clear();
                });
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndices.isNotEmpty ? Colors.black : Colors.grey,
              ),
              child: const Text('Delete'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            // Manual 버튼을 눌렀을 때 FilteredScreen으로 이동
            if (_currentIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Manualscreen()),
              );
            }
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Manual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Simulation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.saved_search_rounded),
            label: 'Small Talk Subject',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
