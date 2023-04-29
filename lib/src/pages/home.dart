import 'package:flutter/material.dart';
import 'package:flutter_instargram/src/components/avatar_widget.dart';
import 'package:flutter_instargram/src/components/image_data.dart';
import 'package:flutter_instargram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2, 
          thumbPath: 'https://demo.ycart.kr/shopboth_farm_max5_001/data/editor/1612/cd2f39a0598c81712450b871c218164f_1482469221_493.jpg',
          size: 70,
        ),
        // 이미지 아래 원
        Positioned(
          right: 10,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                color: Colors.white,
                width: 2
              ),
            ),
            // 원 안에 + 표시
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // 첫 번째 위젯 마진 추가
          const SizedBox(
            width: 20,
          ),
          // 스토리 중 첫 스토리(본인 스토리)만 다른 위젯으로 표현
          _myStory(),
          const SizedBox(
            width: 5,
          ),
          // 리스트 배열 나열
          ...List.generate(
          100, 
          (index) => AvatarWidget(
            type: AvatarType.TYPE1, 
            thumbPath: 'https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E'
            ),
          ),
        ]
        ),
    );
  }

  // 피드를 보여줄 위젯
  Widget _postList() {
    return Column(
      children: 
        List.generate(50, (index) => PostWidget()).toList(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageData(IconsPath.logo, width: 270),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap:() {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
                ),
            )
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(), 
          _postList(),
        ],
      ),
    );
  }
}