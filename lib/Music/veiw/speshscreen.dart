import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacementNamed(context, 'play');
    },);
    return SafeArea(child: Scaffold(
      body: Center(
        child: Container(
          width: 100.w,
            height: 100.h,
            child: Image.asset("assets/images/spotify.jpeg",fit: BoxFit.cover,)),
      ),
    ));
  }
}
