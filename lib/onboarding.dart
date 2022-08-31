import 'package:flutter/material.dart'; //import 치고 'fm 치면 자동완성 가능
import 'package:introduction_screen/introduction_screen.dart';//순한 맛 강좌인만큼 온보딩페이지를 하드코딩하지 않고 패키지를 이용하기로 함
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages:[
        PageViewModel(
            title: 'I Page',
            body: 'Express yourself through this page!',
            image: Image.asset('assets/ipage2.jpg'),
            decoration:getPageDecoration()
        ),
        PageViewModel(
            title: 'Chive Page',
            body: 'Categorize everything using icon you want!',
            image: Image.asset('assets/chivepage2.png'),
            decoration:getPageDecoration()
        ),
        PageViewModel(
            title: 'Feed',
            body: 'if you want, yours can be upload on feed!',
            image: Image.asset('assets/feedpage1.jpg'),
            decoration:getPageDecoration()
        ),
      ],
      done: const Text('done'),//온보딩 페이지를 다 봤을 때 무엇을 할지 지정해주는 버튼
      onDone: (){
        Navigator.pushNamed(context,'/Makeipage');
      }, //done을 눌렀을 때 실행될 코드 작성하면 됨, onPressed와 기능이 같다
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('skip'), //누르면 한 번에 마지막 페이지로 이동함
      dotsDecorator: DotsDecorator( //아래 뜨는 점 세 개 꾸며주는 위젯
          color: Colors.grey,
          size: const Size(10,10),
          activeSize: Size(13,13), //클릭된 점 사이즈 따로 조절하는 아규먼트
          activeShape: RoundedRectangleBorder( //클릭된 점 형태 따로 조절하는 아규먼트
              borderRadius: BorderRadius.circular(24)
          ),
          activeColor: Colors.blueGrey //클릭된 점 색깔
      ),
      curve: Curves.bounceOut, //Curves 치고 마우스 올리면 여러 효과 뜨고 눌러보면서 해당 애니메이션 효과 확인 가능
    );
  }
}

PageDecoration getPageDecoration(){ //pageDecoration으로 타입을 제한함
  return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize:28,
        fontWeight: FontWeight.normal,
      ),
      bodyTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.black38,
          fontFamily: 'Archivo'
      ),
      imageFlex: 4,
      imagePadding: EdgeInsets.only(top:40),
      titlePadding: EdgeInsets.only(top:15, bottom: 15),
      pageColor: Colors.white
  ); //새롭게 생성된 위젯 페이지데코레이션의 인스턴스
}