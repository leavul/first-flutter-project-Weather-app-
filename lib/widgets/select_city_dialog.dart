import 'package:flutter/material.dart';
import 'package:weather_app/widgets/my_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/my_button.dart';

class SelectCityDialog extends StatelessWidget {
  final _controller = TextEditingController();

  SelectCityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      content: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MyTextField(controller: _controller),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MyButton(
                    text: 'Search',
                    bgColor: Theme.of(context).colorScheme.primary,
                    fgColor: Colors.white,
                    onPressed: () async {
                      if (_controller.text == '') {
                        BlocProvider.of<GetWeatherCubit>(context)
                            .notAddedCity();
                      } else {
                        showDialog(
                          context: context,
                          // Prevent closing the dialog by tapping outside
                          barrierDismissible: false,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                        await BlocProvider.of<GetWeatherCubit>(context)
                            .getWeather(cityName: _controller.text);

                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                  ),
                ),
                MyButton(
                    text: 'Cancel',
                    bgColor: Colors.grey.shade100,
                    fgColor: Colors.black,
                    onPressed: () => Navigator.pop(context))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
