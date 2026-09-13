import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class CovidData {
  int year = 0;
  int weekNum = 0;
  int newCases = 0;
  int totalCases = 0;
  int newCasesExcludeAbroad = 0;
  int totalCasesExcludeAbroad = 0;
  int newRecovered = 0;
  int totalRecovered = 0;
  int newDeaths = 0;
  int totalDeaths = 0;
  int caseForeign = 0;
  int casePrison = 0;
  int caseWalkin = 0;
  int caseNewPrev = 0;
  int caseNewDiff = 0;
  int deathNewPrev = 0;
  int deathNewDiff = 0;
  String updateDate = '';

  void mapData(Map<String, dynamic> dataIn) {
    year = dataIn['year'] ?? 0;
    weekNum = dataIn['weeknum'] ?? 0;
    newCases = dataIn['new_case'] ?? 0;
    totalCases = dataIn['total_case'] ?? 0;
    newCasesExcludeAbroad = dataIn['new_case_excludeabroad'] ?? 0;
    totalCasesExcludeAbroad = dataIn['total_case_excludeabroad'] ?? 0;
    newRecovered = dataIn['new_recovered'] ?? 0;
    totalRecovered = dataIn['total_recovered'] ?? 0;
    newDeaths = dataIn['new_death'] ?? 0;
    totalDeaths = dataIn['total_death'] ?? 0;
    caseForeign = dataIn['case_foreign'] ?? 0;
    casePrison = dataIn['case_prison'] ?? 0;
    caseWalkin = dataIn['case_walkin'] ?? 0;
    caseNewPrev = dataIn['case_new_prev'] ?? 0;
    caseNewDiff = dataIn['case_new_diff'] ?? 0;
    deathNewPrev = dataIn['death_new_prev'] ?? 0;
    deathNewDiff = dataIn['death_new_diff'] ?? 0;
    updateDate = dataIn['update_date'] ?? '';
  }

  Future<void> getData() async {
    String uri = 'https://rmuti.ac.th/user/wudthipong/';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      // แปลงข้อมูล JSON Array ให้ถูกต้อง
      List<dynamic> jsonList = jsonDecode(response.body);
      
      if (jsonList.isNotEmpty) {
        // ดึงข้อมูล Object ตัวแรกใน Array มาใช้งาน
        Map<String, dynamic> data = jsonList[0];
        mapData(data);
      }
    } else {
      throw Exception('Failed to load COVID-19 data');
    }
  }
}

CovidData covidData = CovidData();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 Situation',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CovidPage(),
    );
  }
}

class CovidPage extends StatelessWidget {
  const CovidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B80C9),
              Color(0xFF4A3F8B),
            ],
          ),
        ),
        child: SafeArea(
          child: FutureBuilder(
            future: covidData.getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'ไม่สามารถโหลดข้อมูลได้',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                );
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // =========================
                    // ส่วนหัว (Header)
                    // =========================
                    const Text(
                      'สถานการณ์ COVID-19\nในประเทศไทย',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // ป้ายวันที่อัปเดต (ดึงจาก API)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEE161),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ]
                      ),
                      child: Text(
                        'อัปเดต: ${covidData.updateDate}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A3F8B),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // =========================
                    // แถวที่ 1 : หายป่วย (สีเขียว)
                    // =========================
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: 'หายป่วยวันนี้',
                            value: '+${covidData.newRecovered}',
                            bgColor: const Color(0xFF80C058),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatCard(
                            title: 'หายป่วยสะสม',
                            value: '${covidData.totalRecovered}',
                            bgColor: const Color(0xFF6DA946),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // =========================
                    // แถวที่ 2 : ผู้ป่วยใหม่ (สีแดง)
                    // =========================
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: 'ผู้ป่วยใหม่วันนี้',
                            value: '+${covidData.newCases}',
                            bgColor: const Color(0xFFED5D5E),
                            subTexts: [
                              'ในประเทศ: ${covidData.newCasesExcludeAbroad}',
                              'ต่างประเทศ: ${covidData.caseForeign}',
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatCard(
                            title: 'ป่วยสะสม',
                            value: '${covidData.totalCases}',
                            bgColor: const Color(0xFFD35455),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // =========================
                    // แถวที่ 3 : ข้อมูลย่อย 3 ช่อง (ประยุกต์ใช้ข้อมูลจาก API)
                    // =========================
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: 'Walk-in', // แทนที่ 'กำลังรักษา' เพราะ API ไม่มี
                            value: '${covidData.caseWalkin}',
                            bgColor: const Color(0xFF91C5EC),
                            isSmall: true,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatCard(
                            title: 'ในเรือนจำ', // แทนที่ 'ปอดอักเสบ' เพราะ API ไม่มี
                            value: '${covidData.casePrison}',
                            bgColor: const Color(0xFFA58FCC),
                            isSmall: true,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatCard(
                            title: 'เสียชีวิตเพิ่ม',
                            value: '${covidData.newDeaths}',
                            bgColor: const Color(0xFF7A7D84),
                            subTexts: ['สะสม ${covidData.totalDeaths}'],
                            isSmall: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // =========================
                    // Footer
                    // =========================
                    const Text(
                      'ข้อมูลจาก API COVID-19',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// =========================
// Custom Widget สำหรับ Card
// =========================
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color bgColor;
  final List<String>? subTexts;
  final bool isSmall;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.bgColor,
    this.subTexts,
    this.isSmall = false, // ค่าเริ่มต้นคือ Card ขนาดใหญ่
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isSmall ? 12 : 20, 
        horizontal: 8
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8), // ขอบมนน้อยลงคล้ายในภาพ
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isSmall ? 12 : 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isSmall ? 20 : 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2.0,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
          if (subTexts != null && subTexts!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: subTexts!
                    .map(
                      (text) => Text(
                        text,
                        style: TextStyle(
                          fontSize: isSmall ? 10 : 11,
                          color: Colors.white,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ]
        ],
      ),
    );
  }
}