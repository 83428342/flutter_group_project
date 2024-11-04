import 'package:flutter/material.dart';

import 'SettingScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<String> _titles = ['사용법', '메인 화면', '시뮬레이션', '설정'];

  final List<Widget> _pages = [
    Center(child: Text('사용법 화면', style: TextStyle(fontSize: 25))),
    MainListScreen(),
    Center(child: Text('시뮬레이션 화면', style: TextStyle(fontSize: 25))),
    SettingScreen(),
  ];

  // 타이틀을 누르면 다음 페이지로 이동
  void _onTitleTap() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _pages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _onTitleTap,
          child: Text(_titles[_currentIndex]), // 현재 페이지 이름을 표시
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: '사용법',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '메인 화면',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '시뮬레이션',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}

class MainListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text('프사')),
                title: Text('이름 $index'),
                subtitle: Text('마지막 대화 내용 $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}