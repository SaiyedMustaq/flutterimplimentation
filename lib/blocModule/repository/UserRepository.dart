import 'package:lazy_loading_listview/blocModule/models/SignInResponse.dart';
import 'package:lazy_loading_listview/blocModule/models/UserLoginResponse.dart';
import 'package:lazy_loading_listview/blocModule/singInCall/SignInApiProvider.dart';

class UserRepository {
  SignInApiProvider _signInApiProvider = SignInApiProvider();
  Future<ModelLoginResponse> signIn(String username, String password) async {
    return await _signInApiProvider.signIn(username, password);
  }
}
