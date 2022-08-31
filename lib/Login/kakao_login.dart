import 'package:ichive_with_firebase/Login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class Kakaologin implements Sociallogin {
  //kakaologin에다가 alt+enter하면 소셜로그인의 두 기능 오버라이드 자동으로 하는 거 선택 가능
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
        } catch (e) {
          return false;
        }
      } else {
        try{
        await UserApi.instance.loginWithKakaoAccount();
        return true;
      } catch(e) {return false;}
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
