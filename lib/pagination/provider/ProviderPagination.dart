import 'package:flutter/material.dart';

class ProviderPaginationPage extends StatefulWidget {
  const ProviderPaginationPage({Key key}) : super(key: key);

  @override
  _ProviderPaginationPageState createState() => _ProviderPaginationPageState();
}

class _ProviderPaginationPageState extends State<ProviderPaginationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Provider Page'),
      ),
      body: Container(),
    );
  }
}
