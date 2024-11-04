// 이전 대화 내용 기억 기능 추가 필요
// fine tuning 필요

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class Message {
  final String text;
  final bool isUser;

  Message({
    required this.text,
    required this.isUser,
  });
}

// ChatScreen에서 반환
class ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [];
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;

  // Groq API 정보
  final String apiUrl = 'https://api.groq.com/openai/v1/chat/completions';
  final String apiKey =
      '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';

  Future<void> sendMessage() async {
    final input = controller.text.trim();
    if (input.isEmpty) return;

    setState(() {
      // 사용자 메시지를 채팅에 추가
      messages.add(Message(text: input, isUser: true));
      controller.clear();
      isLoading = true;
    });

    try {
      // 추천 응답을 위한 프롬프트 생성
      String prompt = generatePrompt(input);

      // Groq API 호출
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'llama3-8b-8192',
          'messages': [
            {
              'role': 'system',
              'content':
              'You are a friendly assistant who provides helpful and witty recommendations.'
            },
            {'role': 'user', 'content': prompt}
          ],
        }),
      );

      if (response.statusCode == 200) {
        // 특수 문자를 처리하기 위해 UTF-8로 응답 디코딩
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        print('API Response: $data'); // 전체 응답 출력

        // 응답에서 생성된 텍스트 추출
        String generatedText = data['choices'][0]['message']['content'];
        print('Generated Text: $generatedText'); // 생성된 텍스트 출력

        setState(() {
          // 생성된 텍스트를 채팅에 추가
          messages.add(Message(text: generatedText, isUser: false));
          isLoading = false;
        });
      } else {
        print('Error response body: ${response.body}'); // 오류 응답 출력
        setState(() {
          // 오류 메시지를 채팅에 추가
          messages.add(
            Message(text: '오류가 발생했습니다: ${response.statusCode}', isUser: false),
          );
          isLoading = false;
        });
      }
    } catch (e) {
      print('Exception: $e'); // 예외 세부 정보 출력
      setState(() {
        // 네트워크 오류 메시지를 채팅에 추가
        messages.add(
          Message(text: '네트워크 오류가 발생했습니다.', isUser: false),
        );
        isLoading = false;
      });
    }
  }

  // llama에게 응답 양식을 지시
  String generatePrompt(String userInput) {
    return '''
When a user asks the following question or just gives answer, must provide three friendly and witty responses as if you are chatting with a good friend. 

- **Response 1:** very Short length (one sentence).
- **Response 2:** Short length (one sentences).
- **Response 3:** Mideum (two or more sentences).

Feel free to include a bit of humor!

**Example:**

Question: How's the weather today?

Recommended Response 1: Ok:)

Recommended Response 2: bro, u wanna  take a walk with me?

Recommended Response 3: Do you have no eyes lol? just log in to the game

**Question:** $userInput

Recommended Response 1:

Recommended Response 2:

Recommended Response 3:
''';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // 채팅의 각 메시지를 빌드하는 위젯
  Widget buildMessage(Message message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue[200] : Colors.green[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(message.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('대화 화면')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessage(messages[index]);
              },
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) => sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
