import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService().getCurrentWeather(userInputCity: cityName);

      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState(message: e.toString()));
    }
  }

  void notAddedCity() {
    emit(WeatherFailureState(message: 'You did not enter any city name.'));
  }
}
