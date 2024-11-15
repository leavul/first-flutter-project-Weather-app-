import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myTheme(BuildContext context) {
  MaterialColor appPrimaryColor = getThemeColor(
      BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition);

  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: appPrimaryColor,
    ),
    textTheme: GoogleFonts.manropeTextTheme(),
  );
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  condition = condition.toLowerCase();
  if (['sunny'].contains(condition)) {
    return Colors.orange;
  } else if (['clear', 'partly cloudy', 'cloudy', 'overcast']
      .contains(condition)) {
    return Colors.blue;
  } else if ([
    'mist',
    'fog',
    'freezing fog',
    'patchy rain possible',
    'thundery outbreaks possible',
    'fog',
    'moderate or heavy rain shower',
    'patchy rain possible',
    'patchy snow possible',
    'patchy sleet possible',
    'patchy freezing drizzle possible',
    'thundery outbreaks possible',
    'blowing snow',
    'blizzard',
    'freezing drizzle',
    'heavy freezing drizzle',
    'patchy light drizzle',
    'light drizzle',
    'freezing drizzle',
    'heavy freezing drizzle',
    'patchy light rain',
    'light rain',
    'moderate rain at times',
    'moderate rain',
    'heavy rain at times',
    'heavy rain',
    'light freezing rain',
    'moderate or heavy freezing rain',
    'light sleet',
    'moderate or heavy sleet',
    'patchy light snow',
    'light snow',
    'patchy moderate snow',
    'moderate snow',
    'patchy heavy snow',
    'heavy snow',
    'ice pellets',
    'light rain shower',
    'moderate or heavy rain shower',
    'torrential rain shower',
    'light sleet showers',
    'moderate or heavy sleet showers',
    'light snow showers',
    'moderate or heavy snow showers',
    'light showers of ice pellets',
    'moderate or heavy showers of ice pellets',
    'patchy light rain with thunder',
    'moderate or heavy rain with thunder',
    'patchy light snow with thunder',
    'moderate or heavy snow with thunder',
    'patchy light rain with thunder',
    'moderate or heavy rain with thunder',
    'patchy light snow with thunder',
    'moderate or heavy snow with thunder'
  ].contains(condition)) {
    return Colors.blueGrey;
  } else {
    return Colors.grey;
  }
}
