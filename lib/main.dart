import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KotlinCall(),
    );
  }
}

class KotlinCall extends StatefulWidget {
  const KotlinCall({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KotlinCallState createState() => _KotlinCallState();
}

class _KotlinCallState extends State<KotlinCall> {
  static const platform = MethodChannel('samples.flutter.dev/storageInfo');
  String _storageInfo = 'Unknown';

  _getStorageInfo() async {
    String storageInfo;
    try {
      storageInfo = await platform.invokeMethod('getInternalStorageInfo');
    } catch (e) {
      storageInfo = "Failed to get storage info: ${e.toString()}";
    }

    setState(() {
      _storageInfo = storageInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    _getStorageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kotlinのコードを呼ぶ'),
      ),
      body: Center(
        child: Text('ストレージの容量は: $_storageInfo です。'),
      ),
    );
  }
}
