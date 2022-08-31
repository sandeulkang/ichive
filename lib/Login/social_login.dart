//로그인, 로그아웃 기능을 정의하는 추상클래스
abstract class Sociallogin {
  Future<bool> login(); //비동기로 네트워크 통신을 하니까 future, 성공 했는지 그렇지 않은지를 bool로 리턴
  Future<bool> logout();
}
