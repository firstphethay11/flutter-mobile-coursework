import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ep2',
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '16:54',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'พ. 12 ก.ค',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Icon(Icons.settings, size: 20),
                    ],
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.wifi, color: Colors.white),
                      ),

                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.volume_up, color: Colors.white),
                      ),

                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.bluetooth, color: Colors.white),
                      ),

                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.screen_rotation, color: Colors.white),
                      ),

                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.airplanemode_active,
                          color: Colors.white,
                        ),
                      ),

                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.flashlight_on, color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                          ),
                          child: const Text(
                            "ควบคุมอุปกรณ์",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                          ),
                          child: const Text(
                            "เอาต์พุตมีเดีย",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.message,
                                color: Colors.blue,
                                size: 15,
                              ),

                              const SizedBox(width: 5),

                              const Text(
                                'Messages',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),

                              const SizedBox(width: 5),

                              const Text(
                                'อีก +3 รายการ',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(width: 5),

                              const Text(
                                '12:35',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),

                              const Spacer(),

                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              const Text(
                                "True",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Expanded(
                                child: Text(
                                  "TrueSpecial ดีลพิเศษ! เน็ตไม่อั้น ความเร็วสูงสุด",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              const Text(
                                "TrueID",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 5),

                              Expanded(
                                child: Text(
                                  "ชิงรางวัลแพ็กเกจดูบอล EPL ฟรีตลอดฤดูกาล",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              Container(
                                width: 15,
                                height: 15,
                                alignment: Alignment.center,
                                child: const Text(
                                  "8",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    color: Colors.blue.shade100,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          // บรรทัดบน ไอคอน + ข้อความ + ลูกศร
                          Row(
                            children: [
                              const Icon(
                                Icons.settings,
                                color: Colors.black,
                                size: 18,
                              ),

                              const SizedBox(width: 8),

                              const Expanded(
                                child: Text(
                                  "ตั้งค่า Galaxy M23 5G ให้เสร็จ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                              const Icon(Icons.keyboard_arrow_down, size: 22),
                            ],
                          ),

                          // บรรทัดล่าง
                          const Padding(
                            padding: EdgeInsets.only(left: 26),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "อีกเพียงไม่กี่ขั้นตอน",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          // บรรทัดบน ไอคอน + ข้อความ + ลูกศร
                          Row(
                            children: [
                              const Icon(
                                Icons.cloud,
                                color: Colors.blue,
                                size: 15,
                              ),

                              const SizedBox(width: 8),

                              const Expanded(
                                child: Text(
                                  "ซิงค์รูปถ่ายของคุณไปยัง OneDrive 7/7/23",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                              const Icon(Icons.keyboard_arrow_down, size: 22),
                            ],
                          ),

                          // บรรทัดล่าง
                          const Padding(
                            padding: EdgeInsets.only(left: 26),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "เชื่อมต่อบัญชี Samsung และ Microsorft ของคุณเพื่อดูว่า",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ไอคอนอยู่บรรทัดแรก
                          const Icon(Icons.phone_android, size: 15),

                          const SizedBox(width: 10),

                          // เนื้อหา
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "แอพที่แนะนำ",
                                  style: TextStyle(fontSize: 11),
                                ),

                                SizedBox(height: 5),

                                Text(
                                  "มีอัพเดทแอพ 1 พร้อมใช้งาน",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),

                                Text(
                                  "Smart Tutor",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ลูกศรอยู่บรรทัดแรก
                          const Icon(Icons.keyboard_arrow_up, size: 22),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.system_update,
                        color: Colors.blue,
                        size: 18,
                      ),

                      title: const Text(
                        "เลื่อนการอัพเดทแล้ว",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),

                      trailing: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ไอคอนอยู่บรรทัดแรก
                          const Icon(
                            Icons.photo_library,
                            color: Colors.blue,
                            size: 18,
                          ),

                          const SizedBox(width: 10),

                          // เนื้อหา
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // บรรทัดแรก
                                Row(
                                  children: [
                                    Text(
                                      "Photos",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),

                                    SizedBox(width: 5),

                                    Text(
                                      "13:05",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5),

                                Text(
                                  "วันนี้เมื่อ 9 ปีที่แล้ว... ย้อนความทรงจำเมื่อ 12 ก.ค. 2557",
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 3),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "วันนี้เมื่อ 9 ปีที่แล้ว... ย้อนความทรงจำเมื่อ 10 ก.ค. 2557",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                    Text(
                                      "2",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const Icon(Icons.keyboard_arrow_down, size: 22),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.green,
                            size: 15,
                          ),

                          const SizedBox(width: 10),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // บรรทัดแรก
                                Row(
                                  children: [
                                    Text(
                                      "โทรศัพท์",
                                      style: TextStyle(fontSize: 12),
                                    ),

                                    SizedBox(width: 5),

                                    Text(
                                      "28/6/23",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5),

                                // รายละเอียด
                                Text(
                                  "เบอร์ที่ไม่ได้รับสาย 0600031910",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Icon(Icons.keyboard_arrow_down, size: 22),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
