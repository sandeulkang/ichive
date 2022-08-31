import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ichive_with_firebase/Login/signuppage.dart';
import 'package:ichive_with_firebase/Login/loginpage.dart';
import 'package:ichive_with_firebase/addgallery.dart';
import 'package:ichive_with_firebase/makeipage.dart';
import 'package:ichive_with_firebase/Login/makeipage2.dart';
import 'package:ichive_with_firebase/onboarding.dart';
import 'package:ichive_with_firebase/test.dart';


void main () async{
  WidgetsFlutterBinding.ensureInitialized(); //파이어베이스이니셜라이즈앱메서드 부르기 전에 얘 무조건 해야 함
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Archivo') ,
      title: 'I-chive App',
        routes: {
          '/Signuppage':(context) => Signuppage(),
          '/Makeipage':(context) => Makeipage(),
          '/Makeipage2':(context) => Makeipage2(),
          '/OnBoardingPage':(context) => OnBoardingPage(),
          '/addGallery' : (context) => addGallery(),
          '/test' : (context) => test(),
        }, //dd

        home: AnimatedSplashScreen( //이 패키지 이용해서 아이카이브 시작페이지 뜨고 사라지는 거 연출 가능, 아규먼트 보려면 ctrl누르면서 위젯 클릭
          duration: 2000,
          splash: Image.asset('assets/I-CHIVE 로고.png'),
          nextScreen: LoginPage(), //후에 rootpage로 하고 로그인 여부에 따라 makeipage(이것도 나중에 나눠야겟지? 만든적있으면 ipage, 없ㅇ므ㅕㄴ makeipage로)와 loginsignuppage로 나뉘게 한다.
          splashTransition: SplashTransition.fadeTransition, //아규먼트에 사용되는 다양한 효과들 보려면 SplashTransition치고 마우스 올리기
          backgroundColor: Colors.white,
          splashIconSize: 300 //일단 키워놨는데 깨짐. 나중에 포샵으로 더 크게 만들기
      )
    );
  }
}

