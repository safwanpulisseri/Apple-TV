import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Library',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          const CircleAvatar(
            radius: 17,
            child: Text('S', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.grey,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Library Is Empty',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'TV  shows or movies you buy from the Store will',
              style: TextStyle(
                  color: Colors.grey,
                  //fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'appear here.',
              style: TextStyle(
                  color: Colors.grey,
                  //  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
