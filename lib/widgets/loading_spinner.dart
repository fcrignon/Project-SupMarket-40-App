import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LoadingSpinner extends StatefulWidget {
  LoadingSpinner({Key key}) : super(key: key);

  @override
  _LoadingSpinnerState createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<LoadingSpinner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset('assets/svg/isLoading.svg'),
          SleekCircularSlider(
            appearance: CircularSliderAppearance(
              spinnerMode: true,
            ),
          ),
        ],
      ),
    );
  }
}
