import 'package:flutter/material.dart';

class Manualscreen extends StatelessWidget {
  const Manualscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 이전 화면으로 돌아가기
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // 검은 필터 추가
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          // 중앙의 버튼들 추가
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Chat Service로 이동
                    },
                    icon: const Icon(Icons.chat, size: 30, color: Colors.black),
                    label: const Text('Chat Service', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Simulation으로 이동
                    },
                    icon: const Icon(Icons.play_circle_outline, size: 30, color: Colors.black),
                    label: const Text('Simulation', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Small Talk Subject로 이동
                    },
                    icon: const Icon(Icons.saved_search_rounded, size: 30, color: Colors.black),
                    label: const Text('Small Talk Subject', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Settings로 이동
                    },
                    icon: const Icon(Icons.settings, size: 30, color: Colors.black),
                    label: const Text('Settings', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
