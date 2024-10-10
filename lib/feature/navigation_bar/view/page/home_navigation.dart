import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../getx/home_controller.dart';
import '../../../../core/util/png_asset.dart';
import 'package:apple_tv/core/theme/app_color.dart';
import 'package:apple_tv/feature/home/view/page/home_screen.dart';
import 'package:apple_tv/feature/search/view/page/search_screen.dart';
import 'package:apple_tv/feature/library/view/page/library_screen.dart';




class HomeNavigation extends StatelessWidget {
  HomeNavigation({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<Widget> _pages = const [
    HomePage(),
    LibraryPage(),
    LibraryPage(),
    LibraryPage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.selectedIndex.value]), 
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColor.background,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value, 
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.toneOne,
          unselectedItemColor: AppColor.toneTwo,
          onTap: (index) {
            controller.updateIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 0
                    ? AppPngPath.homePageLogoBold
                    : AppPngPath.homePageLogoOutlined,
                width: 25,
                height: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 1
                    ? AppPngPath.applePageLogoBold
                    : AppPngPath.applePageLogoOutlined,
                width: 25,
                height: 25,
              ),
              label: 'Apple TV+',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 2
                    ? AppPngPath.storePageLogoBold
                    : AppPngPath.storePageLogoOutlined,
                width: 25,
                height: 25,
              ),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 3
                    ? AppPngPath.libraryPageLogoBold
                    : AppPngPath.libraryPageLogoOutlined,
                width: 25,
                height: 25,
              ),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                controller.selectedIndex.value == 4
                    ? AppPngPath.searchPageLogoBold
                    : AppPngPath.searchPageLogoOutlined,
                width: 25,
                height: 25,
              ),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
