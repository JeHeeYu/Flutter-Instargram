import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 앱 종료 시 띄울 팝업 관련 클래스
class MessagePopup extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? okCallback;
  final Function()? cancelCallback;
  
  MessagePopup({
    Key? key,
    required this.title,
    required this.message,
    required this.okCallback,
    this.cancelCallback,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        // 팝업 위치를 중앙으로 정렬
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            // 메시지 박스 외부
            ClipRRect (
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                width: Get.width * 0.7,
                // 텍스트 2줄
                child: Column(
                  children: [
                    Text(
                      title!, 
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 17, 
                      color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      message!, 
                      style: const TextStyle(
                      fontSize: 14, 
                      color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 15),
                    // 확인 및 취소 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: okCallback, child: Text('확인')),
                        // 버튼 사이 마진
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: cancelCallback, 
                          child: Text('취소'), 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}