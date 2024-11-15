import 'package:flutter/material.dart';
import 'package:weather_app/widgets/select_city_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import 'package:weather_app/widgets/failure_search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Weather App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              iconSize: 30,
              icon: const Icon(
                Icons.location_on,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SelectCityDialog();
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherWidget();
          } else if (state is WeatherLoadedState) {
            // ignore: prefer_const_constructors, because there issue if user search one time ui will update but the second time ui will not update, so that why I remove const
            return WeatherInfoBody();
          } else if (state is WeatherFailureState) {
            // ignore: prefer_const_constructors
            return FailureSearchWidget(message: state.message);
          } else {
            return const NoWeatherWidget();
          }
        },
      ),
    );
  }
}
