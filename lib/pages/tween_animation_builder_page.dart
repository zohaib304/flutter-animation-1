import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TweenAnimationBuilder"),
        centerTitle: true,
      ),
      body: const HSVColorSelector(),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  const HSVColorSelector({Key? key}) : super(key: key);

  @override
  _HSVColorSelectorState createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1500),
          width: 200,
          height: 200,
          color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
        ),
        const SizedBox(height: 48,),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: _hue),
          duration: const Duration(milliseconds: 1500),
          builder: (context, hue, child) {
            final hsvColors = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
            return Center(
              child: Container(
                width: 200,
                height: 200,
                color: hsvColors.toColor(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 48,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                for (var h = 0; h <= 360; h++)
                  HSVColor.fromAHSV(1.0, h.toDouble(), 1.0, 1.0).toColor(),
              ],
              stops: [for (var h = 0; h <= 360; h++) h.toDouble() / 360.0],
            ),
          ),
        ),
        Slider.adaptive(
          value: _hue,
          max: 360,
          min: 0,
          onChanged: (value) {
            setState(() {
              _hue = value;
            });
          },
        ),
      ],
    );
  }
}
