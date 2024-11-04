import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class seven_screen extends StatelessWidget {
  const seven_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyInterface(),
        appBar: AppBar(
          title: const Text('Add New Chat'),
          centerTitle: true,
          leading: const Icon(
            Icons.edit_note,
            color: Colors.black,
            size: 40,
          ),
        ),

      ),
    );
  }
}

class MyInterface extends StatefulWidget {
  const MyInterface({super.key});

  @override
  _MyInterfaceState createState() => _MyInterfaceState();
}

class _MyInterfaceState extends State<MyInterface> {
  String dropdownValue = '파일';
  String name = '';
  String relationship = '';
  String attitude = '중립';
  String? _filePath;
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path); // 선택한 이미지를 _image에 저장
      } else {
        print('No image selected.');
      }
    });
  }
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );
    setState(() {
      if (result != null) {
        _filePath = result.files.single.path;
      } else {
        print('No file selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      backgroundImage: _image != null? FileImage(_image!) : null,
                      child: _image == null?
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ):null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value){
                  name = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value){
                  relationship = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Relationship',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _filePath != null ? _filePath!.split('/').last : 'Upload KakaoTalk File (TXT)',
                        style: TextStyle(
                          color: _filePath != null ? Colors.black : Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      const Icon(
                        Icons.upload_file,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // 선택된 파일 경로 표시
              if (_filePath != null) Text('Selected file: $_filePath'),
              const SizedBox(height: 16),
              // 태도 입력 스크롤
              DropdownButtonFormField<String>(
                value: attitude,
                onChanged: (String? newvalue){
                  setState(() {
                    attitude = newvalue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Attitute',
                  border: OutlineInputBorder(),
                ),
                items: <String>['긍정','부정','중립','사나움','친절한'].map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // 추가하기 버튼 동작 넣어야함
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}