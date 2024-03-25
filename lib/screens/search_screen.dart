import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
              'Search',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 17,
            child: Text('S', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[600],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: TextField(
                      cursorColor: Colors.black,
                      //autofocus: true,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Shows, Movies and More',
                          hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400)),
                    )),
                    Icon(
                      Icons.mic,
                      color: Colors.grey[600],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
