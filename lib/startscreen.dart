import 'package:currency_converter_app/homepg.dart';
import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1000,
        child: Stack(
          children: [
            Positioned.fill(
              child: Expanded(
                child: Image.asset('images/pic1.jpg', fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Text(
                'Currencey Converter',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 787,
              left: 40,
              child: SizedBox(
                width: 350,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepg()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
