import 'package:flutter/material.dart';

class LastBlackinHomeScreen extends StatelessWidget {
  const LastBlackinHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/miami_pass.png',
            height: 80,
            width: 200,
          ),
          Text(
            'Every match. Every club. No blackouts. Only on',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(
            'Apple TV.',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: Colors.white,
              width: 200,
              height: 40,
              alignment: Alignment.center,
              child: Text(
                'Subscribe',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
      color: Colors.black,
      height: 300,
      width: double.infinity,
    );
  }
}
