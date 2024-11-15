class WeatherModel {
  final String cityName;
  final String countryName;
  final DateTime lastUpdated;
  final String imgPath;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.lastUpdated,
    required this.imgPath,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      countryName: json['location']['country'],
      lastUpdated: DateTime.parse(json['current']['last_updated']),
      imgPath: WeatherModel.getImgPath(json['current']['condition']['icon']),
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['current']['condition']['text'],
    );
  }

  /* 
  In many programming languages, static means that a method or variable belongs 
  to the class itself rather than to any instance of that class. 
  .....
  .....
  .....
  so I use static for the 'factory WeatherModel.fromJson' contractor.
  */
  static String getImgPath(currentImgPath) {
    return currentImgPath.contains('https')
        ? currentImgPath
        : 'https:$currentImgPath';
  }
}
