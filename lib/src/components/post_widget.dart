import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_instargram/src/components/avatar_widget.dart';
import 'package:flutter_instargram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  // 피드에서 아이콘 및 닉네임 위젯
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            type: AvatarType.TYPE3, 
            nickName: "유제필",
            size: 40,
            thumbPath: 'https://cdn.aitimes.com/news/photo/202204/143854_149286_5624.png',
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageData(
                  IconsPath.postMoreIcon,
                  width: 30,
                ),
              ),
            )
        ],
      ),
    );
  }

  // 피드에서 이미지를 출력할 위젯
  Widget _image() {
    return CachedNetworkImage(
      imageUrl: 'https://s-i.huffpost.com/gen/3948866/thumbs/o-PEPE-THE-FROG-570.jpg?3',
      );
  }

  // 이미지 아래 버튼 영역 위젯
  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon, 
                width: 65,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.replyIcon, 
                width: 60,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.directMessage, 
                width: 55,
              ),
            ],
          ),
          ImageData(
                IconsPath.bookMarkOffIcon, 
                width: 50,
            ),
        ],
      ),
    );
  }

  // 좋아요, 닉네임, 댓글 표출 위젯
  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '좋아요 150개', 
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // 글자가 여러 줄일 경우 사용하는 Text
          ExpandableText(
            '콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.\n콘텐츠1입니다.', 
            prefixText: '유제필',
            onPrefixTap: () {
              print('유제필 페이지 이동');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  // 댓글 텍스트 버튼 위젯
  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: (){},
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '댓글 199개 모두 보기',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // 날짜 표출 위젯
  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1일전', 
        style: TextStyle(color: Colors.grey, 
        fontSize: 11,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          const SizedBox(height: 5),
          _infoDescription(),
          const SizedBox(height: 5),
          _replyTextBtn(),
          _dateAgo(),
        ],
      ),
    );
  }
}