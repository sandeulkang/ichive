import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addGallery extends StatefulWidget {
  @override
  State<addGallery> createState() => _addGalleryState();
}

class _addGalleryState extends State<addGallery> {

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path); //imagetemp라는 파이널(변경될수없는) 변수를 만들어 그 file(불특정함)을 넣어줌.

      setState(() => this.image = imageTemp); //그 file을 다시 image에 넣어줌. 한 함수에서 같은 변수가 두 개가 있으면 에러나니 this.붙여서 구분(?)
    } catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            child: Text('Gallery'),
            onPressed: () { pickImage();
            },
          ),
          SizedBox(height: 20,),
          image != null ? Image.file(image!): Text("No image selected") //image가 null이 아닐(!=)/때?이미지파일 /그렇지 않을때:텍스트
        ],
      ),
    );
  }


}