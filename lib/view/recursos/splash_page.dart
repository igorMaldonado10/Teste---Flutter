import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/imgs/logo_app.png',
          height: MediaQuery.of(context).size.height / 2,
          width:  MediaQuery.of(context).size.width / 2),
          CircularProgressIndicator(
            color: Colors.orange.shade900,
          ),
        ],
      ),
    );
  }
}
