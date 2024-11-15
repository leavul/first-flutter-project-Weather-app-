import 'package:flutter/material.dart';

class FailureSearchWidget extends StatelessWidget {
  final String message;
  const FailureSearchWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (message).replaceFirst('Exception: ', ''),
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
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
      ),
    );
  }
}
