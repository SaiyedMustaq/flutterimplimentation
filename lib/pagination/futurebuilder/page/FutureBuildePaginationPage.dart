import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_loading_listview/pagination/futurebuilder/MovieDetailsPage.dart';
import 'package:lazy_loading_listview/pagination/futurebuilder/page/ModelMovieTile.dart';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

class Payload {
  Payload({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.nomerT,
    this.datumOperator,
    this.ourPrice,
  });

  int id;
  String nomerT;
  Operator datumOperator;
  int ourPrice;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nomerT: json["nomer_t"],
        datumOperator: operatorValues.map[json["operator"]],
        ourPrice: json["our_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomer_t": nomerT,
        "operator": operatorValues.reverse[datumOperator],
        "our_price": ourPrice,
      };
}

enum Operator { KV }

final operatorValues = EnumValues({"kv": Operator.KV});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class FutureBuilderPaginationPage extends StatefulWidget {
  FutureBuilderPaginationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FutureBuilderPaginationPage createState() => _FutureBuilderPaginationPage();
}

class _FutureBuilderPaginationPage extends State<FutureBuilderPaginationPage> {
  int page = 1;
  List<Datum> _DataList = [];
  List<Results> _MoviewList = [];
  Future<List<Datum>> _future;
  Future<List<Results>> _futureMovies;
  ScrollController _controller = ScrollController();
  static const String IMAGE_BASE_URL = "http://image.tmdb.org/t/p/w185";

  Future<List<Results>> getData(int pageCount) async {
    String url =
        Uri.encodeFull("https://nomer.biz.ua/mobile/kievstar?page=$pageCount");

    String BASE_URL =
        Uri.encodeFull("https://api.themoviedb.org/3/movie/popular");
    String MOVIE_API_KEY = '?api_key=d2d6b80f09b12b49732cf20e7647ae1f';
    print('FINAL URL===>> ${BASE_URL + MOVIE_API_KEY}');

    var movieResponse = await http
        .get(BASE_URL + MOVIE_API_KEY + "&page=" + pageCount.toString())
        .timeout(const Duration(seconds: 10));
    print('STRING ${movieResponse.body}');
    MovieModel modelMovie = MovieModel.fromJson(jsonDecode(movieResponse.body));
    log('RESPONSE', error: jsonDecode(movieResponse.body));

    _MoviewList.insertAll(_MoviewList.length, modelMovie.results);

    page++;
    return _MoviewList;
  }

  @override
  void initState() {
    _futureMovies = getData(page);
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          _futureMovies = getData(page);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Future pagination'),
        ),
        body: FutureBuilder(
            future: _futureMovies,
            builder: (BuildContext ctx, AsyncSnapshot<List<Results>> snapshot) {
              // if (snapshot.connectionState != ConnectionState.done) {
              //   print('HAVE DATE ${snapshot.data}');
              //   return Center(child: CircularProgressIndicator());
              // }

              if (snapshot.hasError) {
                return Center(child: Text("Error"));
              }
              if (!snapshot.hasData) {
                return Center(child: Text("Error"));
              }

              var dataToShow = snapshot.data;

              return ListView.builder(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  controller: _controller,
                  itemCount: dataToShow == null ? 0 : dataToShow.length + 1,
                  itemBuilder: (BuildContext context, int index) => dataToShow
                              .length ==
                          index
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MoviesPageDetails(
                                        movieModel: dataToShow[index],
                                      )));
                            },
                            trailing:
                                Text(dataToShow[index].releaseDate.toString()),
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            isThreeLine: false,
                            tileColor: Colors.white.withOpacity(0.1),
                            leading: Hero(
                              tag: 'image',
                              child: Image(
                                  image: NetworkImageWithRetry(
                                      IMAGE_BASE_URL +
                                          dataToShow[index].posterPath,
                                      scale: 0.5), // NetworkImageWithRetry
                                  fit: BoxFit.fill),
                            ),
                            title: Text(dataToShow[index].title.toString()),
                            subtitle:
                                Text(dataToShow[index].popularity.toString()),
                          ),
                        ));
            }));
  }
}
