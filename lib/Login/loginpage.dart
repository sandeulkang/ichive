import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ichive_with_firebase/pallete.dart';


class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _loginformKey = GlobalKey<FormState>(); // form(전체)에 모두 값이 입력됐는지 확인위한 키

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: lightblue,
        body: Container(
            padding: const EdgeInsets.all(70.0),
            child: Form( //id,password빈칸 모두를 form이라 지칭
              key: _loginformKey, // form(전체)에 모두 값이 입력됐는지 확인위한 키인데 이거 해제하거나 플로우 순서 바꿔야 조인인 눌렀을 때 이동가능
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //두줄이니까 column이고 children으로 그 자식들
                children: <Widget> [
                const Text('I-Chive',
                  style: TextStyle(fontSize: 30),),
                SizedBox(
                    height: 25.0
                ),
                TextFormField(
                  //입력 위한 칸은 textfield
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 0.0, 00.0, 0.0), // 칸 바깥의 여백
                    border: OutlineInputBorder(), //아웃라인 만들기
                    hintText: 'ID',
                  ),
                  keyboardType: TextInputType.number, //입력자는 number로
                ),
                SizedBox(
                    height: 10.0
                ), //column에서 입력칸들 사이에 생기는 ㄴ여백
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 0.0, 00.0, 0.0), // 칸 바깥의 여백
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 3.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, //row를 오른쪽 정렬
                    children: [
                      TextButton(
                          child: Text(
                            'JOIN IN',
                            style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context,'/Signuppage'); //회원가입 창으로 가는 코드 작성
                          }),
                      SizedBox(width: 3),
                      TextButton(
                          child: Text(
                            'FIND PASSWORD',
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context,'/OnBoardingPage');
                            //비번찾기 창으로 가는 코드 작성해야됨 원래는 ㅇㅇ ㅣㅈ금은 makeipage보려고 해둠
                          },
                      ),
                    ],
                  ),
                ),
          ],
      ),),),
      );
    }
  }
