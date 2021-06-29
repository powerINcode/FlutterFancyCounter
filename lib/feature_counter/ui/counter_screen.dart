import 'package:blur/blur.dart';
import 'package:counter_app/feature_counter/ui/counter_block.dart';
import 'package:counter_app/feature_counter/ui/widgets/counter_widget.dart';
import 'package:counter_app/feature_counter/ui/widgets/plasma_backgroun_widget.dart';
import 'package:counter_app/feature_counter/ui/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (_) => CounterCubic(),
            child: Builder(
                builder: (context) => Stack(
                      alignment: Alignment.center,
                      children: [
                        PlasmaBackgroundWidget(),
                        Blur(
                          blur: 0.2,
                          colorOpacity: 0.0,
                          child: Text(
                            "WIO fancy counter",
                            style: TextStyle(
                                fontSize: 32, fontFamily: 'Yellowtail'),
                          ),
                        ),
                        Positioned(
                            top: 10.h,
                            child: CounterWidget(
                                value: context.select((CounterCubic cubic) =>
                                    cubic.state.counter))),
                        Positioned(
                            bottom: 10.0.h,
                            child: SliderWidget(
                              width: 180,
                              height: 70,
                              onMore: () =>
                                  context.read<CounterCubic>().increment(),
                              onLess: () =>
                                  context.read<CounterCubic>().decrement(),
                            ))
                      ],
                    ))));
  }
}
