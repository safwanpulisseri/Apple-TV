import 'package:apple_tv/screens/movies_details_page.dart';

import 'package:flutter/material.dart';

class WidgetMovieContents extends StatelessWidget {
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
      height: 160, // Adjusted height to accommodate numbers and text
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        padEnds: false,
        itemCount: imagePath.length,
        controller: PageController(
          viewportFraction: 0.65,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MoviesDetailsPage(imagePath: imagePath[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        width: 200,
                        imagePath[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name of Movies',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text('Description'),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
