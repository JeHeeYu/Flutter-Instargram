import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_instargram/src/pages/search/search_focus.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  // 이미지를 담을 배열
  List<List<int>> groupBox = [[], [], []];

  // 이미지를 사이즈에 매칭되는 위치에 넣을 수 있도록 해주는 배열
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();

    for(var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if(gi != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }

      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }

    print(groupBox);
  }
// 서치 화면에서의 검색 앱바
  Widget _appbar() {
    return Row(
      children: [
        // 서치바 클릭 이벤트
          Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>const SearchFocus()));
                },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text('검색', style: TextStyle(fontSize: 15, color: Color(0xff838383),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  // 서치 탭에서 보여줄 이미지 뷰
  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length, 
          (index) => Expanded(
            child: Column(
              children: List.generate(
                  groupBox[index].length, 
                  (jndex) => Container(
                    height: Get.width * 0.33 * groupBox[index][jndex],
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.primaries[
                        Random().nextInt(Colors.primaries.length)]),
                        child: CachedNetworkImage(imageUrl: 'https://demo.ycart.kr/shopboth_farm_max5_001/data/editor/1612/cd2f39a0598c81712450b871c218164f_1482469221_493.jpg', 
                        fit: BoxFit.cover,
                        ),
                ),
              ).toList(),
            ),
          ), 
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(child:_body()),
          ],
        ),
      ),
    );
  }
}