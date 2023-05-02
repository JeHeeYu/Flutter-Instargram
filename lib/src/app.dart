import 'package:flutter/material.dart';
import 'package:flutter_instargram/src/components/image_data.dart';
import 'package:flutter_instargram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_instargram/src/pages/home.dart';
import 'package:flutter_instargram/src/pages/search.dart';
import 'package:get/get.dart';


class App extends GetView<BottomNavController> {
  const App({Key? key})   : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 뒤로가기 버튼 클릭 시 WillPopScope로 이벤트 처리
    return WillPopScope(
      child: Obx(
        () => Scaffold (
        body: IndexedStack(
          index: controller.pageIndex.value,
          children: [
            const Home(),
            const Search(),
            Container(
              child: Center(child: Text('UPLOAD')),
              ),
            Container(
              child: Center(child: Text('ACTIVITY')),
              ),
            Container(
              child: Center(child: Text('MYPAGE')),
              ),
          ],
        ),
        // 바텀 NavigationBar 정의
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // BottomNavController의 pageIndex 값으로 페이지 인덱스 관리
          currentIndex: controller.pageIndex.value,
          elevation: 0,
          // 바텀 탭 클릭 시 이벤트 처리
          onTap: controller.changeBottomNav,
          items: [
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.homeOn),
              activeIcon: ImageData(IconsPath.homeOff),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.searchOff),
              activeIcon: ImageData(IconsPath.searchOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.uploadIcon),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconsPath.activeOff),
              activeIcon: ImageData(IconsPath.activeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, 
                  color: Colors.grey,
                ),
              ),
              label: 'home',
              ),
            ],
          ),
          ),
        ),
        onWillPop: controller.willPopAction,
    );
  }
}