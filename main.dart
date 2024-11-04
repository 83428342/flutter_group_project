import 'package:flutter/material.dart';
import 'chatbot.dart';
import '7screen.dart';
import 'two_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // 각 화면에 대응하는 리스트
  final List<Widget> _screens = [
    const ChatScreen(),  // Manual 탭을 눌렀을 때 ChatBotScreen이 표시됨
    SimulationScreen(),
    const seven_screen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],  // 현재 선택된 화면 표시
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: '일단의 Chatbot 넣어둠',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Simulation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.saved_search_rounded),
            label: '일단은 7 screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}


// 대화 주제 화면
class SmallTalkSubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('대화 주제 화면'),
    );
  }
}

// 설정 화면
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('설정 화면'),
    );
  }
}
