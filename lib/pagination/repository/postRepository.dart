import 'package:lazy_loading_listview/models/PostListModel.dart';
import 'package:lazy_loading_listview/networkModule/BaseUrl.dart';
import 'package:lazy_loading_listview/networkModule/HttpClient.dart';

class PostRepository {
  Future<dynamic> fetchPost() async {
    final response = await HttpClient.instance.getCall(url: EndPoint.todos);
    return PostListModel.fromJson(response);
  }
}
