import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Center(child: Text('사용법 페이지')), // 'Usage' page
    const SmallTalk(), // Main page
    const Center(child: Text('시뮬레이션 페이지')), // 'Simulation' page
    const Center(child: Text('설정 페이지')), // 'Settings' page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Labels are always shown
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
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

class SmallTalk extends StatelessWidget {
  const SmallTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      // SafeArea를 사용하여 시스템 UI와 겹치지 않도록 합니다.
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '스몰토크 주제 추천',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 30), // Add spacing
              Text('[첫만남]'),
              SizedBox(height: 20),
              Text('1. 간단한 자기소개'),
              Text('2. MBTI'),
              Text('3. 생일'),
              Text('4. 술/담배 여부'),
              Text('5. 전공 및 현재 직무'), // 번호를 추가했습니다.
              SizedBox(height: 30),
              Text('[주제2]'),
              SizedBox(height: 100),
              Text('1. 주제 추천 내역'),
            ],
          ),
        ),
      ),
    );
  }
}
