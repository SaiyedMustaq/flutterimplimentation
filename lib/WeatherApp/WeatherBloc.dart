import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading_listview/WeatherApp/Weather.dart';
import 'package:lazy_loading_listview/WeatherApp/WeatherEvent.dart';
import 'package:lazy_loading_listview/WeatherApp/WeatherRepository.dart';
import 'package:lazy_loading_listview/WeatherApp/WeatherState.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null), super(null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) {
    
    throw UnimplementedError();
  }

  // @override
  // Stream<WeatherState> mapEventToState(
  //   WeatherState currentState,
  //   WeatherEvent event,
  // ) async* {
  //   if (event is FetchWeather) {
  //     yield WeatherLoading();
  //     try {
  //       final Weather weather = await weatherRepository.getWeather(event.city);
  //       yield WeatherLoaded(weather: weather);
  //     } catch (_) {
  //       yield WeatherError();
  //     }
  //   }
  // }
}