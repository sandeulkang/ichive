import 'package:flutter/material.dart';

class test extends StatefulWidget {
  //사용자가 그림을 움직이고 나면 setstate으로 상태를 새롷 ㅐ주어야 하므로 당연히 stful 클래스여야 하고,
  //setstate되는 대상은 당연히 상태를 가지고 있어야 함. 그러니 container같은 상수는 안되고 차라리 상수를 가진 변수(?함수?)여야 함 그래서 아래 새롭게 iimage라는변수 만든거고.

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  Widget iimage = Image.asset('assets/checkboxicon.png');
  double? _x;
  double? _y;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Positioned(
          left: _x,
          top: _y,
          child: Draggable(
            child: iimage, //드래그될 친구
            feedback: iimage, //드래그 되는 애가 움직여질 때 어떻게 표시될지
            childWhenDragging: const SizedBox(), //null해도 보여서 sizedbox로 해서 일종의 투명처리를 함
            onDragEnd: (dragdetails) {
              setState(() {
                _x = dragdetails.offset.dx;
                _y = dragdetails.offset.dy;
              },);
            },
          ),
        ),],
      ),
    );
  }
}
