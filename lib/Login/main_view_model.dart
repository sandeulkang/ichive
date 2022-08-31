import 'package:ichive_with_firebase/Login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainViewModel {
  final Sociallogin _sociallogin;
  bool isLogined = false;
  User? user; //null일수있으니 ? 넣어서 null처리 <-안하면 Non-nullable instance field 'user' must be initialized. 이라고 오류 뜸

  MainViewModel(this._sociallogin);

  Future login() async{
    isLogined = await _sociallogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async{
    await _sociallogin.logout();
    isLogined = false;
    user = null;
  }
}