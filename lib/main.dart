import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import 'package:lazy_loading_listview/ApiCall.dart';
import 'package:lazy_loading_listview/WeatherApp/WatherAppPage.dart';
import 'package:lazy_loading_listview/blocModule/login_bloc/LoginBloc.dart';
import 'package:lazy_loading_listview/blocModule/repository/UserRepository.dart';
import 'package:lazy_loading_listview/blocModule/login_page/blocLoginPage.dart';
import 'package:lazy_loading_listview/checkConnection/ConnectionStatusSingleton.dart';
import 'package:lazy_loading_listview/lifecycle/flutter_lifecycle.dart';
import 'package:lazy_loading_listview/navigationPage/pages.dart';
import 'package:lazy_loading_listview/pagination/PaginationNavigation.dart';
import 'package:lazy_loading_listview/permissionHandler/permissionHendlerPage.dart';
import 'package:lazy_loading_listview/provider/AuthProvider.dart';
import 'package:lazy_loading_listview/providerPage/ProviderPage.dart';
import 'package:lazy_loading_listview/providerPage/firebase/MobileOtpVerifay.dart';
import 'package:lazy_loading_listview/sizeConfigModule/SizeConfig.dart';
import 'package:lazy_loading_listview/sizer/SizerPage.dart';
import 'package:lazy_loading_listview/timePicker/TimePickerPage.dart';
import 'package:lazy_loading_listview/utils/Constants.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shimmer/shimmer.dart';

import 'checkConnection/CheckInternetConnection.dart';
import 'dissmissview/DissmissListView.dart';

void main() {
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  runApp(
    MyApp(),
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

var pageHeight;
var pageWidth;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(UserRepository())),
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),

        // builder: (context, widget) => ResponsiveWrapper.builder(
        //   BouncingScrollWrapper.builder(context, widget),
        //   maxWidth: double.infinity,
        //   minWidth: double.infinity,
        //   defaultScale: true,
        //   breakpoints: [
        //     ResponsiveBreakpoint.resize(450, name: MOBILE),
        //     ResponsiveBreakpoint.autoScale(800, name: TABLET),
        //     ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        //     ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        //     ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        //   ],
        // ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
      ),
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

  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    pageHeight = MediaQuery.of(context).size.height;
    pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => WetherAppPage())),
                    child: Text('Weather App')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PageOne())),
                    child: Text('Navigation Pages')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProviderPage())),
                    child: Text('Provider Page')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PaginationNavigation())),
                    child: Text('Pagination')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    child: Text('Mobile Otp Firebase')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => DissmissViewPage())),
                    child: Text('Dismiss List View')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ConnectionCheck())),
                    child: Text('Check Connection')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PermissionHandlerPage())),
                    child: Text('Permission Handler')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ApiCall())),
                    child: Text('Api handle')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TimePickerPage())),
                    child: Text('Time Picker')),
                SizedBox(height: 20),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SizerPage())),
                    child: Text('Sizer Page')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ScreenLifecycle())),
                    child: Text('ScreenLifecycle')),
                SizedBox(height: Constants.margin.extraSmall),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(
                                  userRepository: UserRepository(),
                                ))),
                    child: Text('Login Page')),
              ],
            ),
          ),
        ));
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
