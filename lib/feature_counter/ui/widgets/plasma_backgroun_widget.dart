import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:counter_app/app_theme.dart';

class PlasmaBackgroundWidget extends StatelessWidget {
  const PlasmaBackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          backgroundBlendMode: BlendMode.srcOver),
      child: PlasmaRenderer(
        type: PlasmaType.infinity,
        particles: 17,
        color: Theme.of(context).particlesColor,
        blur: 0.51,
        size: 0.41,
        speed: 0.98,
        offset: 0,
        blendMode: BlendMode.plus,
        variation1: 0.41,
        variation2: 0.48,
        variation3: 0.24,
        rotation: 1,
      ),
    );
  }
}