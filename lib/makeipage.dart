import 'package:fading_image_button/fading_image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart'; //svg파일 사용하기 위해

//스낵바 또는ㅂ ㅓ튼 활용해서 make ipage 만들고 이미지 넣고 손가락으로 화면 모았을 때 페이지 전환되도록
class Makeipage extends StatefulWidget {
  @override
  State<Makeipage> createState() => _MakeipageState();
}

class _MakeipageState extends State<Makeipage> {
  double _baseScaleFactor = 1.0;
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        //gesturedetector는 범위를 container로아무리 크게 잡아도 최종 실제 위젲ㅅ으로 됨, 그런데 범위를 화면 전체로 하고 싶으면 이 코드 하면 됨 이건 키보드 내릴때도 사용됨~
        onScaleUpdate: (details) {
          setState(() {
            _scaleFactor = _baseScaleFactor *
                details
                    .scale; //scalefactor 변수는 우리가 만든 것이므로 그 자체만 봤을 때 이동된 부분 값인지를 모름. 그래서 베이스스케일팩터에 디테일을 곱해줌으로써 그 이동된 부분이라는 의미를 부여해주는 거임
            if (_scaleFactor < 10) //이쉑 수, 등호 어떻게 해도 조금만 움직이면 바로 넘어감; 나중에 수정하자
              print('daf');
            Navigator.pushNamed(context, '/Makeipage2');
          });
        },
        child: Stack(children: [
          Positioned(
            left: 160,
            bottom: 180,
            child: Opacity(
                //얘 깜빡거리게 하고 싶은데
                opacity: 0.7,
                child: Image.asset(
                  'assets/line+.png',
                  scale: 1.5,
                )),
          ),
          Positioned(
            left: 250,
            bottom: 310,
            child: Opacity(
                //얘 깜빡거리게 하고 싶은데
                opacity: 0.7,
                child: Image.asset(
                  'assets/line-.png',
                  scale: 1.5,
                )),
          ),
          Positioned(
            left: 230,
            bottom: 220,
            child: Opacity(
                //얘 깜빡거리게 하고 싶은데
                opacity: 0.7,
                child: Image.asset(
                  'assets/zoomout.png',
                  scale: 1.5,
                )),
          ),
          const Center(
              child: Text(
            'Express yourself!',
            style: TextStyle(
              fontSize: 20,
            ),
          )),
        ]),
      ),
    );
  }
}
