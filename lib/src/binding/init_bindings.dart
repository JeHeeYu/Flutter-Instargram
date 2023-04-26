import 'package:flutter_instargram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

// 앱이 실행되는 동시에 GetX 컨트롤러들을 필요에 따라 Instance가 올려주기 위한 클래스
class InitBinding extends Bindings {
  @override
  void dependencies() {
    // permanent: true 를 주어 Instance가 앱 종료 시 까지 살아 있도록 설정
    Get.put(BottomNavController(), permanent: true);
  }
}