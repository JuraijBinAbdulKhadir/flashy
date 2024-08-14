import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class FlashyPage extends StatefulWidget {
  const FlashyPage({super.key});

  @override
  State<FlashyPage> createState() => _FlashyPageState();
}

class _FlashyPageState extends State<FlashyPage> {
  bool lightOn=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child:IconButton(
          icon: Icon(
            lightOn?Icons.flashlight_on_rounded:Icons.flashlight_off_rounded,
            size: 100,
            color: lightOn?Colors.amber.shade300:Colors.white
          ),
          onPressed: _toggleFlashlight,) ,) ,
    );
  }
 void _toggleFlashlight() async {
    try {
      if (lightOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        lightOn = !lightOn;
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

}