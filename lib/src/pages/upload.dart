import 'package:flutter/material.dart';
import 'package:flutter_instargram/src/components/image_data.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  Widget _imagePreview() {
    return Container(
      width: Get.width, 
      height: Get.width,
       color:Colors.grey
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: const [
                Text(
                  '갤러리', 
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 18,
                  )
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xff808080),
                  borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    ImageData(IconsPath.imageSelectIcon),
                    const SizedBox(width: 7),
                    const Text(
                      '여러 항목 선택',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(6), 
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, 
                  color: Color(0xff808080),
                ),
                child: ImageData(IconsPath.cameraIcon),
              )
            ],
          )
        ],
      ),
    );
  }

  // 업로드할 아이콘 뷰
  Widget _imageSelectList() {
    return GridView.builder(
      // 스크롤 미사용
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ), 
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.red,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.closeImage,),
          ),
        ),
        title: const Text(
          'NEW Post', 
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          )
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconsPath.nextImage, width: 50),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}