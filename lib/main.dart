import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import 'package:lazy_loading_listview/ApiCall.dart';
import 'package:lazy_loading_listview/ThemeNotifier.dart';
import 'package:lazy_loading_listview/checkConnection/ConnectionStatusSingleton.dart';
import 'package:lazy_loading_listview/nabigationPage/pages.dart';
import 'package:lazy_loading_listview/pagination/PaginationNavigation.dart';
import 'package:lazy_loading_listview/permissionHandler/permissionHendlerPage.dart';
import 'package:lazy_loading_listview/providerPage/ProviderPage.dart';
import 'package:lazy_loading_listview/providerPage/firebase/MobileOtpVerifay.dart';
import 'package:lazy_loading_listview/timePicker/TimePickerPage.dart';
import 'package:lazy_loading_listview/utils/Constants.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'checkConnection/CheckInternetConnection.dart';
import 'dissmissview/DissmissListView.dart';

void main() {
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightTheme),
      child: MyApp(),
    ),
  );
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.yellow[700],
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeNotifier.getTheme(),
      home: MyHomePage(title: 'IncrementallyLoadingListView demo'),
      initialRoute: '/',
      routes: {
        //'/': (context) => MyHomePage(),
        '${Constants.routeName.pageOne}': (context) => PageOne(),
        '${Constants.routeName.pageTwo}': (context) => PageTwo(),
        '${Constants.routeName.pageThree}': (context) => PageThree(),
        '${Constants.routeName.pageFour}': (context) => PageFour(1),
        '${Constants.routeName.pageFive}': (context) => PageFive(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = [];
  bool _loadingMore;
  bool _hasMoreItems;
  int _maxItems = 30;
  int _numItemsPage = 10;
  Future _initialLoad;

  Future _loadMoreItems() async {
    final totalItems = items.length;
    await Future.delayed(Duration(seconds: 3), () {
      for (var i = 0; i < _numItemsPage; i++) {
        items.add(Item('Item ${totalItems + i + 1}'));
      }
    });

    _hasMoreItems = items.length < _maxItems;
  }

  List<Data> data = [];
  @override
  void initState() {
    super.initState();
    // _initialLoad = Future.delayed(Duration(seconds: 3), () {
    //   // List items = [];
    //   items = <Item>[];
    //   for (var i = 0; i < _numItemsPage; i++) {
    //     items.add(Item('Item ${i + 1}'));
    //   }
    //   _hasMoreItems = true;
    // });
  }

  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
          child: Column(
            children: [
              Switch(
                onChanged: (bool value) => OnOffTogggle(),
                value: toggleValue,
              ),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => PageOne())),
                  child: Text('Navigation Pages')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProviderPage())),
                  child: Text('Provider Page')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaginationNavigation())),
                  child: Text('Pagination')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                  child: Text('Mobile Otp Firebase')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DissmissViewPage())),
                  child: Text('Dismiss List View')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ConnectionCheck())),
                  child: Text('Check Connection')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PermissionHandlerPage())),
                  child: Text('Permission Handler')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ApiCall())),
                  child: Text('Api handle')),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.grey[100],
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TimePickerPage())),
                  child: Text('Time Picker')),
            ],
          ),
        ));
  }

  OnOffTogggle() {
    toggleValue = !toggleValue;
    setState(() {});
  }

  buildDynamicKeyUI(List<Data> data) {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, itemIndex) {
          return buildTitle(
              data: data[itemIndex].name, obj: data[itemIndex].userList);
        });
  }

  buildTitle({List<Autogenerated> obj, bool isTitleShow, List<String> data}) {
    return Container(
      child: Text(
        '14',
      ),
    );
  }

  builtDataIsTitleShow(List<Autogenerated> userList) {
    return false;
  }

  buildLoadMoreUI() {
    return FutureBuilder(
      future: _initialLoad,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            return IncrementallyLoadingListView(
              hasMore: () => _hasMoreItems,
              itemCount: () => items.length,
              loadMore: () async {
                await _loadMoreItems();
              },
              onLoadMore: () {
                setState(() {
                  _loadingMore = true;
                });
              },
              onLoadMoreFinished: () {
                setState(() {
                  _loadingMore = false;
                });
              },
              separatorBuilder: (_, __) => Divider(),
              loadMoreOffsetFromBottom: 2,
              itemBuilder: (context, index) {
                final item = items[index];
                if ((_loadingMore ?? false) && index == items.length - 1) {
                  return Column(
                    children: <Widget>[
                      ItemCard(item: item),
                      PlaceholderItemCard(item: item),
                    ],
                  );
                }
                return ItemCard(item: item);
              },
            );
          default:
            return Text('Something went wrong');
        }
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(item.avatarUrl),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: Text(item.name),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Text(item.message),
              )
            ],
          ),
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ItemDetailsPage(item)),
      ),
    );
  }
}

class PlaceholderItemCard extends StatelessWidget {
  const PlaceholderItemCard({Key key, this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        item.name,
                        style: TextStyle(color: Colors.transparent),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  color: Colors.white,
                  child: Text(
                    item.message,
                    style: TextStyle(color: Colors.transparent),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetailsPage extends StatelessWidget {
  final Item item;
  const ItemDetailsPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text(item.name),
        ),
        body: Container(
          child: Text(item.message),
        ));
  }
}

class Item {
  final String name;
  final String avatarUrl = 'http://via.placeholder.com/60x60';
  final String message =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  Item(this.name);
}

class Data {
  final List<String> name;
  final List<Autogenerated> userList;

  Data({this.name, this.userList});
}

class User {
  final String id;
  final String username;

  User({this.id, this.username});
}

class Autogenerated {
  int id;
  String date;
  String time;
  String solicitorContactDetail;
  String summaryNote;
  String consultaionTime;
  int advanceFees;
  int totalFees;
  int isReferredOther;
  String referredReason;
  String transactionId;
  CommunicationMode communicationMode;
  Customer customer;
  Null referred;
  Matter matter;

  Autogenerated(
      {this.id,
      this.date,
      this.time,
      this.solicitorContactDetail,
      this.summaryNote,
      this.consultaionTime,
      this.advanceFees,
      this.totalFees,
      this.isReferredOther,
      this.referredReason,
      this.transactionId,
      this.communicationMode,
      this.customer,
      this.referred,
      this.matter});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    solicitorContactDetail = json['solicitor_contact_detail'];
    summaryNote = json['summary_note'];
    consultaionTime = json['consultaion_time'];
    advanceFees = json['advance_fees'];
    totalFees = json['total_fees'];
    isReferredOther = json['is_referred_other'];
    referredReason = json['referred_reason'];
    transactionId = json['transaction_id'];
    communicationMode = json['communication_mode'] != null
        ? new CommunicationMode.fromJson(json['communication_mode'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    referred = json['referred'];
    matter =
        json['matter'] != null ? new Matter.fromJson(json['matter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['solicitor_contact_detail'] = this.solicitorContactDetail;
    data['summary_note'] = this.summaryNote;
    data['consultaion_time'] = this.consultaionTime;
    data['advance_fees'] = this.advanceFees;
    data['total_fees'] = this.totalFees;
    data['is_referred_other'] = this.isReferredOther;
    data['referred_reason'] = this.referredReason;
    data['transaction_id'] = this.transactionId;
    if (this.communicationMode != null) {
      data['communication_mode'] = this.communicationMode.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    data['referred'] = this.referred;
    if (this.matter != null) {
      data['matter'] = this.matter.toJson();
    }
    return data;
  }
}

class CommunicationMode {
  int id;
  String name;
  String icon;
  String iconUrl;

  CommunicationMode({this.id, this.name, this.icon, this.iconUrl});

  CommunicationMode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    iconUrl = json['icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['icon_url'] = this.iconUrl;
    return data;
  }
}

class Customer {
  int id;
  String name;
  Null photo;
  int amlStatus;
  Null amlExpiryDate;
  Null photoUrl;

  Customer(
      {this.id,
      this.name,
      this.photo,
      this.amlStatus,
      this.amlExpiryDate,
      this.photoUrl});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    amlStatus = json['aml_status'];
    amlExpiryDate = json['aml_expiry_date'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['aml_status'] = this.amlStatus;
    data['aml_expiry_date'] = this.amlExpiryDate;
    data['photo_url'] = this.photoUrl;
    return data;
  }
}

class Matter {
  int id;
  int userId;
  String name;
  String description;
  List<String> photos;
  Null matterNumber;

  Matter(
      {this.id,
      this.userId,
      this.name,
      this.description,
      this.photos,
      this.matterNumber});

  Matter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    description = json['description'];
    photos = json['photos'].cast<String>();
    matterNumber = json['matter_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['photos'] = this.photos;
    data['matter_number'] = this.matterNumber;
    return data;
  }
}
