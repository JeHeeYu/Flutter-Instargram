import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';
import '../pages/upload.dart';

enum PageName{
  HOME,
  SEARCH,
  UPLOAD,
  ACTIVITY,
  MYPAGE
}

// 바텀 NavigationBar 클릭 이벤트 관련 클래스
class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNavigationKey = 
      GlobalKey<NavigatorState>();
  List<int> bottomHistory = [0];

  // 바텀 NavigationBar 클릭 시 이벤트
  void changeBottomNav(int value, {bool hasGesture = false}) {
    var page = PageName.values[value];

    switch(page) {
      case PageName.UPLOAD:
        // Upload 버튼 클릭 시 Upload 클래스 호출
        Get.to(()=> const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture );
        break;
      default:
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if(!hasGesture) {
      return;
    }
    if(bottomHistory != value) {
      bottomHistory.add(value);
    }
  }

  // 뒤로가기 클릭 이벤트
  Future<bool> willPopAction() async {
    // List 남은 이전 스크린이 없을 경우
    if(bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup (
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
          title: '시스템',
        ));
      return true;
    }
    else {
      // 현재 페이지
      var page = PageName.values[bottomHistory.last];

      if(page == PageName.SEARCH) {
        var value = await searchPageNavigationKey.currentState!.maybePop();
        if(value) return false;
      }

      // 마지막 인덱스 지우기
      bottomHistory.removeLast();

      // 마지막으로 입력했던 화면으로 변경
      var index = bottomHistory.last;
      _changePage(index);
      
      return false;
    }
  }
}