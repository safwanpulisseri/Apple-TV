import 'package:flutter/material.dart';

class WidgetMovieContents extends StatelessWidget {
  WidgetMovieContents({super.key});
  final List<String> imagePath = [
    'assets/WhatsApp Image 2024-03-22 at 17.01.09_cleanup (1).jpeg',
    'assets/WhatsApp Image 2024-03-22 at 17.01.10_cleanup (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.39 (1) (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.40 (1) (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.39 (2).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.40 (3).jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        padEnds: false,
        itemCount: imagePath.length,
        controller: PageController(
          viewportFraction: 0.65,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 10),
            // decoration: BoxDecoration(
            //     //borderRadius: BorderRadius.circular(10),
            //     ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
