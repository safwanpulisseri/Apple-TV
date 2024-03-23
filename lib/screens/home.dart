import 'package:apple_tv/widgets/movie_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final List<String> imagePath = [
    'assets/WhatsApp Image 2024-03-22 at 17.01.09_cleanup (1).jpeg',
    'assets/WhatsApp Image 2024-03-22 at 17.01.10_cleanup (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.39 (1) (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.40 (1) (1).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.39 (2).jpeg',
    'assets/WhatsApp Image 2024-03-23 at 09.47.40 (3).jpeg',
  ];

  final _pageController = PageController();
  final _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0,
        title: Row(
          children: [
            Icon(
              Icons.apple,
              size: 50,
              color: Colors.white,
            ),
            Text(
              'tv+',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.music_off,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_circle_outline_sharp,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 17,
            child: Text('S', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.grey,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int index) {
                      _currentPage.value = index; // Update currentPage notifier
                    },
                    children: imagePath.map((path) {
                      return Image.asset(
                        path,
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ValueListenableBuilder<int>(
                        valueListenable: _currentPage,
                        builder: (context, currentPageValue, _) {
                          return PageViewDotIndicator(
                            currentItem: currentPageValue,
                            count: imagePath.length,
                            unselectedColor: Colors.grey,
                            selectedColor: Colors.white,
                            size: const Size(8, 8),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Top Chart: TV Shows ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            WidgetMovieContents(),
            SizedBox(
              height: 150,
            ),
            WidgetMovieContents(),
            SizedBox(
              height: 150,
            ),
            WidgetMovieContents(),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade700,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
