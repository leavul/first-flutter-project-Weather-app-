import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '';
  final dio = Dio();

  Future<WeatherModel> getCurrentWeather(
      {required String userInputCity}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': userInputCity,
          'days': 1,
          'aqi': 'no'
        },
      );

      var jsonData = response.data;
      WeatherModel result = WeatherModel.fromJson(jsonData);
      return result;

      // if there an error that have status code.
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there wan an error, try latter.';

      throw Exception(errorMessage);

      // for catch any other error and displayed for me.
    } catch (e) {
      throw Exception('Oops there wan an error, try latter.');
    }
  }
}
