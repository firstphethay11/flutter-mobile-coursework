import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:flutter/services.dart'; // <-- C: เพิ่ม Import สำหรับระบบสั่น

List<CameraDescription>? cameras;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Camera & Video App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController? controller;
  
  bool isRecording = false; 
  
  // A: ตัวแปรเก็บ Index ของกล้อง (0 = กล้องหลัง, 1 = กล้องหน้า)
  int _currentCameraIndex = 0; 

  @override
  void initState() {
    super.initState();
    loadCamera();
  }

  void loadCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        // ดึงกล้องตาม Index ที่กำหนด
        _initCamera(_currentCameraIndex);
      } else {
        print("NO any camera found");
      }
    } catch (err) {
      print('Error: $err');
    }
  }

  // A: เมธอดสำหรับตั้งค่าและเริ่มทำงานกล้อง
  Future<void> _initCamera(int cameraIndex) async {
    controller = CameraController(cameras![cameraIndex], ResolutionPreset.max);
    await controller!.initialize();
    if (mounted) setState(() {});
  }

  // A: เมธอดสำหรับสลับกล้องหน้า-หลัง
  void _switchCamera() async {
    if (cameras == null || cameras!.length < 2) return; // ต้องมีกล้องมากกว่า 1 ตัวถึงจะสลับได้
    
    // สลับค่า Index (จาก 0 เป็น 1 หรือจาก 1 เป็น 0)
    _currentCameraIndex = (_currentCameraIndex + 1) % cameras!.length;
    
    // ปิดกล้องตัวเดิมก่อน
    await controller?.dispose();
    
    // เปิดกล้องตัวใหม่
    await _initCamera(_currentCameraIndex);
  }

  // ==========================================
  // ระบบที่ 1: การถ่ายภาพนิ่ง
  // ==========================================
  void _takePicture() async {
    try {
      if (controller != null && controller!.value.isInitialized) {
        
        // C: สั่งให้มือถือสั่นจังหวะสั้นๆ 1 ครั้ง เมื่อกดถ่ายภาพ
        HapticFeedback.vibrate(); 
        
        XFile image = await controller!.takePicture();
        await GallerySaver.saveImage(image.path, toDcim: true);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('📸 บันทึกภาพนิ่งลงแกลเลอรี่แล้ว!')),
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // ==========================================
  // ระบบที่ 2: การบันทึกวิดีโอ 
  // ==========================================
  Future<void> startVideoRecording() async {
    try {
      await controller!.startVideoRecording();
      setState(() {
        isRecording = true;
      });
    } on CameraException catch (e) {
      print('Error starting to record video: $e');
    }
  }

  Future<XFile?> stopVideoRecording() async {
    try {
      XFile file = await controller!.stopVideoRecording();
      setState(() {
        isRecording = false;
      });
      
      await GallerySaver.saveVideo(file.path, toDcim: true);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('🎥 บันทึกวิดีโอลงแกลเลอรี่แล้ว!')),
        );
      }
      return file;
    } on CameraException catch (e) {
      print('Error stopping video recording: $e');
      return null;
    }
  }

  void _checkAndToggleVideo() {
    if (controller != null && controller!.value.isInitialized) {
      if (isRecording) {
        stopVideoRecording();
      } else {
        startVideoRecording();
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        // A: เพิ่มปุ่มสลับกล้องไว้ที่มุมขวาบนของ AppBar
        actions: [
          if (!isRecording) // ซ่อนปุ่มสลับกล้องตอนอัดวิดีโอ
            IconButton(
              icon: const Icon(Icons.flip_camera_ios),
              tooltip: 'Switch Camera',
              onPressed: _switchCamera,
            ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: controller == null
              ? Container(
                  color: const Color(0xFF121212),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera_alt_outlined, size: 64, color: Colors.white24),
                        SizedBox(height: 16),
                        Text(
                          'Hardware Camera Sensor Viewfinder',
                          style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Full HD 1080p • 60 FPS • Haptic Shutter',
                          style: TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              : controller!.value.isInitialized
              ? CameraPreview(controller!)
              : const CircularProgressIndicator(),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (!isRecording) 
            FloatingActionButton(
              onPressed: _takePicture, 
              tooltip: 'Take Picture',
              backgroundColor: Colors.blue,
              child: const Icon(Icons.camera_alt, color: Colors.white), 
            ),

          FloatingActionButton(
            onPressed: _checkAndToggleVideo, 
            tooltip: isRecording ? 'Stop Recording' : 'Record Video',
            backgroundColor: isRecording ? Colors.red : Colors.blue, 
            child: Icon(
              isRecording ? Icons.stop : Icons.videocam, 
              color: Colors.white
            ), 
          ),
        ],
      ),
    );
  }
}