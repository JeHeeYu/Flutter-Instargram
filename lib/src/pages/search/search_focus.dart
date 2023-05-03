import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instargram/src/components/image_data.dart';
import 'package:flutter_instargram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({super.key});

  @override
  State<SearchFocus> createState() => _SearchFOcusState();
}

class _SearchFOcusState extends State<SearchFocus> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  // 서치 바 아래 메뉴 탭
  Widget _tapMenuOne(String menu) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        menu, 
      style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      child: Container(
        // 디바이스의 AppBar만큼 높이 지정
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        child: TabBar(
          controller: tabController, 
          // 서치 바 아래 탭 메뉴 바텀 색 지정
          indicatorColor: Colors.black,
          tabs: [
            _tapMenuOne('인기'),
            _tapMenuOne('계정'),
            _tapMenuOne('오디오'),
            _tapMenuOne('태그'),
            _tapMenuOne('장소'),
          ]
        ),
      ),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  // 탭 간 이동하는 위젯
  Widget _body() {
    return TabBarView(
      controller: tabController,
      children: const [
        Center(child: Text('인기 페이지')),
        Center(child: Text('계정 페이지')),
        Center(child: Text('오디오 페이지')),
        Center(child: Text('태그 페이지')),
        Center(child: Text('장소 페이지')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: BottomNavController.to.willPopAction,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(
              IconsPath.backBtnIcon
              ),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0xffefefef),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '검색',
              contentPadding: EdgeInsets.only(left: 15, top: 10, bottom: 7),
              isDense: true,
            ),
          ),
        ),
        bottom: _tabMenu(),
        ),
      // 서치바 아래 부분
      body: _body(),
    );
  }
}