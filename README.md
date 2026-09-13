# Cross-Platform Mobile Application Development (Flutter & Dart)
### RMUTI Computer Engineering • Mobile Computing & Software Engineering Coursework

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.44+-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.12+-0175C2?style=flat-square&logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-222222?style=flat-square)](https://flutter.dev/multi-platform)
[![UI Framework](https://img.shields.io/badge/UI-Material%203-5b5b5b?style=flat-square)](https://m3.material.io)
[![Status](https://img.shields.io/badge/Repo-Public-2ea44f?style=flat-square)](https://github.com/firstphethay11/flutter-mobile-coursework)

<p>
  คลังรวบรวมผลงานและโครงงานปฏิบัติการพัฒนาแอปพลิเคชันมือถือข้ามแพลตฟอร์มด้วย <strong>Flutter & Dart</strong><br />
  หลักสูตรวิศวกรรมคอมพิวเตอร์ มหาวิทยาลัยเทคโนโลยีราชมงคลอีสาน (RMUTI)
</p>

</div>

---

## สารบัญ (Table of Contents)

- [1. ตารางสรุปผลงานปฏิบัติการ (Module Showcase Index)](#1-ตารางสรุปผลงานปฏิบัติการ-module-showcase-index)
- [2. รายละเอียดเชิงลึกแต่ละโมดูล (Technical Module Breakdown)](#2-รายละเอียดเชิงลึกแต่ละโมดูล-technical-module-breakdown)
  - [Lab 01: Flutter State & Counter Architecture](#lab-01-flutter-state--counter-architecture)
  - [Lab 05: Mobile OS Quick Settings & Notification Drawer](#lab-05-mobile-os-quick-settings--notification-drawer)
  - [Lab 06: COVID-19 Situation Dashboard & REST API](#lab-06-covid-19-situation-dashboard--rest-api)
  - [Lab 07: Student Roster Form, Dynamic List & Storage](#lab-07-student-roster-form-dynamic-list--storage)
  - [Lab 08: Hardware Camera Viewfinder, Video & Haptics](#lab-08-hardware-camera-viewfinder-video--haptics)
  - [Lab 09: GPS Geolocation & Map Routing](#lab-09-gps-geolocation--map-routing)
- [3. แผนผังโครงสร้างโฟลเดอร์ (Directory Structure)](#3-แผนผังโครงสร้างโฟลเดอร์-directory-structure)
- [4. ข้อมูลผู้จัดทำ (Author)](#4-ข้อมูลผู้จัดทำ-author)

---

## 1. ตารางสรุปผลงานปฏิบัติการ (Module Showcase Index)

<table width="100%">
  <thead>
    <tr>
      <th width="12%" align="center">โมดูล</th>
      <th width="28%" align="center">หัวข้อและทักษะทางเทคนิค</th>
      <th width="25%" align="center">สถาปัตยกรรม & ไลบรารี</th>
      <th width="35%" align="center">ผลการรันจริง (Mobile Viewport)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center"><code>lab01</code></td>
      <td><strong>Flutter Counter & State</strong><br />ทำความเข้าใจโครงสร้าง Widget Tree, วงจรชีวิต Stateful Widget, และการอัปเดตสถานะด้วย <code>setState()</code></td>
      <td>
        • <code>flutter/material.dart</code><br />
        • Theme Seed Color<br />
        • FloatingActionButton
      </td>
      <td align="center"><img src="docs/screenshots/01-lab01-counter-app.png" alt="Lab 01 Counter App" width="85%" /></td>
    </tr>
    <tr>
      <td align="center"><code>lab05</code></td>
      <td><strong>Mobile OS Quick Settings</strong><br />จำลองแผงควบคุมระบบ (Control Center) และแถบแจ้งเตือนระดับระบบปฏิบัติการ พร้อม Dark Theme</td>
      <td>
        • Custom Tile & Card Layouts<br />
        • CircleAvatar Toggle State<br />
        • Expanded Grid Controls
      </td>
      <td align="center"><img src="docs/screenshots/02-lab05-quicksettings-drawer.png" alt="Lab 05 Quick Settings" width="85%" /></td>
    </tr>
    <tr>
      <td align="center"><code>lab06</code></td>
      <td><strong>COVID-19 Situation Dashboard</strong><br />การเชื่อมต่อ Public REST API แบบ Asynchronous, แปลงข้อมูล JSON สู่ Typed Data Model และแดชบอร์ดสถิติ</td>
      <td>
        • <code>http: ^1.2.1</code><br />
        • JSON Deserialization<br />
        • LinearGradient & Card Metrics
      </td>
      <td align="center"><img src="docs/screenshots/03-lab06-covid-dashboard.png" alt="Lab 06 Covid Dashboard" width="85%" /></td>
    </tr>
    <tr>
      <td align="center"><code>lab07</code></td>
      <td><strong>Student Roster Management</strong><br />ระบบลงทะเบียนและจัดการรายชื่อนักศึกษาด้วย Dynamic ListView, การจัดการหน่วยความจำถาวร และฟอร์มป้อนข้อมูล</td>
      <td>
        • <code>path_provider: ^2.1.2</code><br />
        • <code>ListView.builder</code> Dynamic List<br />
        • Keyboard Dismiss FocusScope
      </td>
      <td align="center"><img src="docs/screenshots/04-lab07-student-roster.png" alt="Lab 07 Student Roster" width="85%" /></td>
    </tr>
    <tr>
      <td align="center"><code>lab08</code></td>
      <td><strong>Hardware Camera & Video</strong><br />การเข้าถึงเซนเซอร์กล้องฮาร์ดแวร์, สลับเลนส์หน้า-หลัง, บันทึกภาพนิ่ง/วิดีโอ, สั่นเตือน Haptic, และเซฟลงแกลเลอรี่</td>
      <td>
        • <code>camera: ^0.11.0+2</code><br />
        • <code>gallery_saver_plus: ^3.2.0</code><br />
        • <code>HapticFeedback.vibrate()</code>
      </td>
      <td align="center"><img src="docs/screenshots/05-lab08-camera-interface.png" alt="Lab 08 Camera" width="85%" /></td>
    </tr>
    <tr>
      <td align="center"><code>lab09</code></td>
      <td><strong>GPS Geolocation & Mapping</strong><br />การดึงพิกัดดาวเทียมเรียลไทม์, ตรวจสอบสิทธิ์การเข้าถึงตำแหน่ง, เรนเดอร์แผนที่, ปักหมุดย่าโม และวาดเส้นทาง Polyline</td>
      <td>
        • <code>geolocator: ^14.0.3</code><br />
        • <code>google_maps_flutter</code><br />
        • <code>flutter_map: ^8.3.2</code>
      </td>
      <td align="center"><img src="docs/screenshots/06-lab09-gps-map-routing.png" alt="Lab 09 GPS Map Routing" width="85%" /></td>
    </tr>
  </tbody>
</table>

---

## 2. รายละเอียดเชิงลึกแต่ละโมดูล (Technical Module Breakdown)

### Lab 01: Flutter State & Counter Architecture
- **โฟลเดอร์:** `labs/lab01-flutter-counter-state/`
- **แนวคิดหลัก:** เรียนรู้โครงสร้างรากฐานของ Flutter Framework แยกส่วนระหว่าง `StatelessWidget` และ `StatefulWidget`
- **การจัดการ State:** ใช้ `setState()` เพื่อกระตุ้นให้ Flutter Engine ทำการ Re-render เฉพาะกิ่งของ Widget Tree ที่มีการเปลี่ยนแปลงค่าตัวแปร `_counter`

### Lab 05: Mobile OS Quick Settings & Notification Drawer
- **โฟลเดอร์:** `labs/lab05-mobile-ui-quicksettings/`
- **แนวคิดหลัก:** การออกแบบ Responsive UI สำหรับแอปพลิเคชันมือถือที่มีความซับซ้อนสูง เลียนแบบแถบ Quick Settings และ Notification Tray ของสมาร์ตโฟน
- **คอมโพเนนต์สำคัญ:**
  - สวิตช์เปิด-ปิดการเชื่อมต่อ (Wi-Fi, Bluetooth, เสียง, หมุนหน้าจอ, โหมดเครื่องบิน, ไฟฉาย) ด้วย `CircleAvatar`
  - การ์ดแสดงผลการแจ้งเตือนหลายรูปแบบ (Messages, Phone, Google Cloud/OneDrive, App Updates)
  - การจัดการ ScrollView และ SafeArea เพื่อรองรับหน้าจอที่มีรอยบาก (Notch/Dynamic Island)

### Lab 06: COVID-19 Situation Dashboard & REST API
- **โฟลเดอร์:** `labs/lab06-covid-tracker-api/`
- **แนวคิดหลัก:** การสื่อสารข้อมูลผ่านเครือข่ายอินเทอร์เน็ตด้วยโปรโตคอล HTTP RESTful API
- **การจัดการข้อมูล:**
  - ดึงข้อมูลสถิติสดจาก API มหาวิทยาลัยเทคโนโลยีราชมงคลอีสาน (`https://rmuti.ac.th/user/wudthipong/`)
  - คลาส `CovidData` สำหรับ Deserialization ข้อมูล JSON Object เข้าสู่ตัวแปรประเภท Typed Data
  - ออกแบบแดชบอร์ดสรุปยอดผู้ป่วยรายวัน, ผู้ป่วยสะสม, ผู้รักษาหาย, และผู้เสียชีวิต ด้วยโทนสีสื่อความหมาย

### Lab 07: Student Roster Form, Dynamic List & Storage
- **โฟลเดอร์:** `labs/lab07-student-roster-form/`
- **แนวคิดหลัก:** การจัดการฟอร์มรับข้อมูล (Form Input Handling) และระบบบันทึกไฟล์ถาวร
- **แบ่งการพัฒนาเป็น 2 ส่วน:**
  - `part1-file-storage/`: การเข้าถึงไดเรกทอรีพื้นที่จัดเก็บของระบบผ่าน `path_provider` บันทึกรายชื่อลงไฟล์ข้อความ `students.txt`
  - `part2-dynamic-list-form/`: ส่วนติดต่อผู้ใช้ด้วย `ListView.builder` รองรับการเพิ่มและลบรายการแบบ Dynamic พร้อมกลไก `FocusScope.unfocus()` ซ่อนคีย์บอร์ดเมื่อกดเพิ่มข้อมูล

### Lab 08: Hardware Camera Viewfinder, Video & Haptics
- **โฟลเดอร์:** `labs/lab08-camera-video-recorder/`
- **แนวคิดหลัก:** การโต้ตอบกับฮาร์ดแวร์ระดับต่ำของอุปกรณ์มือถือ (Native Device Camera Subsystem)
- **คุณลักษณะสำคัญ:**
  - ตรวจสอบรายชื่อกล้องที่มีในระบบผ่าน `availableCameras()` และเปิดใช้ `CameraController`
  - สลับการทำงานระหว่างกล้องหน้าและกล้องหลัง (Camera Lens Facing Switch)
  - ถ่ายภาพนิ่ง (Photo Capture) และบันทึกวิดีโอ (Video Recording)
  - ระบบสั่นสัมผัส `HapticFeedback.vibrate()` เมื่อกดชัตเตอร์
  - นำไฟล์สื่อที่บันทึกได้ส่งเข้าสู่อัลบั้มของระบบปฏิบัติการมือถือผ่าน `GallerySaver`

### Lab 09: GPS Geolocation & Map Routing
- **โฟลเดอร์:** `labs/lab09-gps-google-maps/`
- **แนวคิดหลัก:** การระบุพิกัดตำแหน่งทางภูมิศาสตร์ (Location Services) และการประมวลผลแผนที่
- **คุณลักษณะสำคัญ:**
  - ตรวจสอบสิทธิ์การเข้าถึงตำแหน่ง `LocationPermission` และเปิดใช้งาน GPS เซนเซอร์ผ่าน `Geolocator`
  - คำนวณละติจูด/ลองจิจูดแบบ High Precision
  - ปักหมุดตำแหน่งปัจจุบัน และหมุดพิกัดปลายทาง **อนุสาวรีย์ท้าวสุรนารี (ย่าโม จ.นครราชสีมา)**: `14.974796 N, 102.098127 E`
  - ลากเส้นเชื่อมโยงเส้นทาง (Polyline) ระหว่างตำแหน่งผู้ใช้และปลายทาง

---

## 3. แผนผังโครงสร้างโฟลเดอร์ (Directory Structure)

```text
flutter-mobile-coursework/
├── labs/
│   ├── lab01-flutter-counter-state/           # พื้นฐาน Flutter Widget & Reactive State
│   │   ├── lib/main.dart
│   │   └── pubspec.yaml
│   │
│   ├── lab05-mobile-ui-quicksettings/         # จำลองแถบ Quick Settings & Notification Center
│   │   ├── lib/ (main.dart, Ep1.dart, Ep2.dart)
│   │   └── pubspec.yaml
│   │
│   ├── lab06-covid-tracker-api/               # COVID-19 Situation Dashboard & REST API
│   │   ├── lib/main.dart
│   │   └── pubspec.yaml
│   │
│   ├── lab07-student-roster-form/             # ระบบจัดการรายชื่อนักศึกษาและบันทึกไฟล์
│   │   ├── part1-file-storage/                # การอ่าน-เขียนไฟล์ข้อความในระบบ (path_provider)
│   │   └── part2-dynamic-list-form/           # ฟอร์มเพิ่ม-ลบรายชื่อ (Material 3 Dynamic List)
│   │
│   ├── lab08-camera-video-recorder/           # การเข้าถึงฮาร์ดแวร์กล้องและระบบสั่น
│   │   ├── lib/main.dart
│   │   └── pubspec.yaml
│   │
│   └── lab09-gps-google-maps/                 # พิกัด GPS และการเรนเดอร์แผนที่
│       ├── lib/ (main.dart, main_backup.dart)
│       ├── keyapi.example.txt
│       └── pubspec.yaml
│
├── docs/
│   └── screenshots/                           # ภาพถ่ายผลการรันจริง (Mobile Viewport)
│       ├── 01-lab01-counter-app.png
│       ├── 02-lab05-quicksettings-drawer.png
│       ├── 03-lab06-covid-dashboard.png
│       ├── 04-lab07-student-roster.png
│       ├── 05-lab08-camera-interface.png
│       └── 06-lab09-gps-map-routing.png
│
├── .gitignore                                 # กรอง Dart/Flutter artifacts และ API Keys
└── README.md                                  # เอกสารรวมระบบงานปฏิบัติการ
```

---

## 4. ข้อมูลผู้จัดทำ (Author)

<div align="center">

**Jirawat Thiamthanong**  
Computer Engineering Student, Rajamangala University of Technology Isan (RMUTI)  
Nakhon Ratchasima, Thailand

[GitHub](https://github.com/firstphethay11) &nbsp;•&nbsp; [LinkedIn](https://www.linkedin.com/in/phethay-genko-602261427/) &nbsp;•&nbsp; [Email](mailto:nongfirst.aoy@gmail.com)

</div>
