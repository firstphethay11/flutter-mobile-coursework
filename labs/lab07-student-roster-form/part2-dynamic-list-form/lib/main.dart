import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // ตัวแปรสำหรับรับข้อมูลจาก TextField
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // รายชื่อนักศึกษา
  final List<String> students = [
    'CPE-6601   สมชาย รักเรียน',
    'CPE-6602   กานดา สดใส',
    'CPE-6603   ธนกร พัฒนา',
  ];

  // เพิ่มนักศึกษา
  void addStudent() {
    if (idController.text.isNotEmpty && nameController.text.isNotEmpty) {
      setState(() {
        students.add('${idController.text}   ${nameController.text}');
      });

      // เคลียร์ข้อมูลและเอาแป้นพิมพ์ลง (นำจากข้อ 20 มาใส่ให้สมบูรณ์)
      idController.clear();
      nameController.clear();
      FocusScope.of(context).unfocus(); 
    }
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เพิ่มรายชื่อนักศึกษา')),
      body: Column(
        children: [
          // ส่วนแสดงรายชื่อนักศึกษา
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Container(
                  // เพิ่มเส้นคั่นบางๆ ด้านล่างให้เหมือนในรูปเป๊ะๆ
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1.0), 
                    ),
                  ),
                  child: ListTile(
                    title: Text(students[index]),
                    
                    // 📌 ส่วนที่เพิ่มเข้ามาใหม่: ปุ่มกากบาทสำหรับลบข้อมูล
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.black87),
                      onPressed: () {
                        setState(() {
                          // ลบข้อมูลออกจาก List ตามตำแหน่ง (index)
                          students.removeAt(index);
                        });
                      },
                    ),
                    
                  ),
                );
              },
            ),
          ),

          // ส่วนกรอกข้อมูล
          Container(
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'รหัสนักศึกษา'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'ชื่อ นามสกุล'),
                ),
              ],
            ),
          ),
        ],
      ),

      // ปุ่ม + (จัดตำแหน่งกึ่งกลางสมมาตร)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: addStudent,
        child: const Icon(Icons.add),
      ),
    );
  }
}