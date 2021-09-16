import 'package:flutter/cupertino.dart';
import 'package:lazy_loading_listview/WeatherApp/Weather.dart';
import 'package:lazy_loading_listview/WeatherApp/WeatherApiClient.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
