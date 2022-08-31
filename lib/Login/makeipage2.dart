import 'package:fading_image_button/fading_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart'; //svg파일 사용하기 위해
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:photo_view/photo_view.dart';

class Makeipage2 extends StatefulWidget {
  @override
  State<Makeipage2> createState() => _Makeipage2state();
}

class _Makeipage2state extends State<Makeipage2> {
  Widget image = Container(); // ?를 붙여줌으로써 nullable(image는 null일 수 있음을 허용)
  double? _x; //
  double? _y;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                ipage(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        pickImage();
                      },
                      highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트 안보이게
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/galleryicon.png',
                            width: 70,
                            height: 70,
                          ),
                          Text("gallery")
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트 안보이게
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/texticon.png',
                            width: 70,
                            height: 70,
                          ),
                          Text("text")
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트 안보이게
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/foldericon.png',
                            width: 70,
                            height: 70,
                          ),
                          Text("folder")
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    InkWell(
                      onTap: () {
                        pickImage();
                      },
                      highlightColor: Colors.transparent, //모서리로 퍼져나가는 이펙트 안보이게
                      splashColor: Colors.transparent, //클릭시 원형 이펙트 안보이게
                      child: Image.asset(
                        'assets/checkboxicon.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }

  Widget ipage() {
    //if (image != null) { print('good!');
      return Stack(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.8),
            ),
            child: Positioned(
              left: _x,
              top: _y,
              child: Draggable(
                child: PhotoView(imageProvider: ImageProvider ),
                // null이 아니라고 증명해주는 !는 애초에 null이 아닌 것에만 붙일 수 있음.. 근데 image.는..
                feedback:PhotoView(imageProvider: ),
                childWhenDragging: const SizedBox(),
                onDragEnd: (dragdetails) {
                  setState(
                    () {
                      _x = dragdetails.offset.dx;
                      _y = dragdetails.offset.dy;
                    },
                  );
                },
              ),
            ),
          ),
        ],
      );
    //} else {return Container(height: 500,decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.8),),);}
  }

  Future pickImage() async {
    //지금 실행될 거 아니고 나중에 아이콘 눌렀을 때 실행될 아이니까 future로 감싸주기

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(
          image.path); //image를 setstate 하기 위한 새 변수가 필요해서 만든 듯? path는 모르겠음 뭔지.

      setState(() =>
      this.image = Image.file(imageTemp)); //한 함수에서 같은 변수가 두 개가 있으면 에러나니 this.붙여서 구분(?)

      return ipage();

    } catch (e) {
      print('Failed to pick image: $e');
    }
  }


}
