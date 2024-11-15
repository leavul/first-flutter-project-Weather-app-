import 'package:flutter/material.dart';

class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No city has been selected to display',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const Text(
            'it\'s weather 👀.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const [
                  TextSpan(text: 'Click '),
                  WidgetSpan(child: Icon(Icons.location_on, size: 18)),
                  TextSpan(text: ' for select city.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
