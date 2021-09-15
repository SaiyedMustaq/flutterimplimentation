import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/models/PostListModel.dart';
import 'package:lazy_loading_listview/networkModule/BaseUrl.dart';
import 'package:lazy_loading_listview/networkModule/HttpClient.dart';
import 'package:lazy_loading_listview/pagination/repository/postRepository.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({Key key}) : super(key: key);

  @override
  _ApiCallState createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  List<PostListModel> modelPostLit = [];
  PostRepository postRepository = PostRepository();
  Map request = {};

  @override
  void initState() {
    // TODO: implement initState
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (_, index) => Text('${'Hello'}')),
    );
  }

  void callApi() async {
    PostListModel postListModel;
    HttpClient.instance
        .getCall(
          url: EndPoint.todos,
        )
        .then((value) => {postListModel = jsonDecode(value)});
  }
}
