import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
   
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacementNamed('onboarding');
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Center(
        child:
        SvgPicture.asset('assets/Logo.svg'),
      ),
    ),);
  }
}
