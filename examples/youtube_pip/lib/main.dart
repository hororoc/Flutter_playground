import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_pip/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter PIP Test',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OverlayEntry? entry;
  Offset offset = Offset(100, 100);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    hideOverlay();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIP Test App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.visibility),
              label: Text('Show Floating Widget'),
              onPressed: entry == null ? showOverlay : () {},
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.visibility_off),
              label: Text('Hide Floating Widget'),
              onPressed: hideOverlay,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          print(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.video_camera),
            label: 'Video',
          ),
        ],
      ),
    );
  }

  void showOverlay() {
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (details) {
            // setState(() => offset += details.delta);
            offset += details.delta;
            entry!.markNeedsBuild();
          },
          // child: ElevatedButton.icon(
          //   icon: Icon(Icons.stop_circle_rounded),
          //   label: Text('Record'),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.redAccent),
          //   ),
          //   onPressed: () {},
          // ),
          child: VideoPlayer(),
        ),
      ),
    );

    final overlay = Overlay.of(context);

    overlay!.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }
}
