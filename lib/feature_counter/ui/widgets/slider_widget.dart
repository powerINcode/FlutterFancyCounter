import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class SliderWidget extends StatefulWidget {
  final double width;
  final double height;
  final Function? onMore;
  final Function? onLess;

  const SliderWidget(
      {Key? key,
      this.width = 280,
      this.height = 120,
      this.onMore,
      this.onLess})
      : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  _SliderWidgetState() {
    _animationController = AnimationController(vsync: this, lowerBound: -2.0, upperBound: 2.0)
      ..addListener(() {});

    _animationController.value = 0.0;

    _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1.5, 0.0))
        .animate(_animationController);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Material(
        type: MaterialType.canvas,
        borderRadius: BorderRadius.circular(widget.height / 2),
        color: Theme.of(context).accentColor.withOpacity(0.2),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 10,
                child: Icon(Icons.remove,
                    size: 40,
                    color:
                        Theme.of(context).iconTheme.color!.withOpacity(0.7))),
            Positioned(
                right: 10,
                child: Icon(Icons.add,
                    size: 40,
                    color:
                        Theme.of(context).iconTheme.color!.withOpacity(0.7))),
            GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: SlideTransition(
                position: _animation,
                child: Material(
                  shape: CircleBorder(),
                  color: Theme.of(context).accentColor,
                  child: SizedBox(
                    width: widget.height,
                    height: widget.height,
                    child: Icon(
                      Icons.trip_origin,
                      size: widget.height / 2,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onPanStart(DragStartDetails details) {
    _animationController.stop();
    _animationController.value = _globalPositionToLocal(details.globalPosition);
  }

  _onPanUpdate(DragUpdateDetails details) {
    _animationController.value = _globalPositionToLocal(details.globalPosition);
  }

  _onPanEnd(DragEndDetails details) {
    _animationController.stop();
    final SpringDescription springDescription =
        new SpringDescription.withDampingRatio(
      mass: 0.9,
      stiffness: 90.0,
      ratio: 0.6,
    );
    final offset = _animationController.value;

    if (offset >= 0.5) {
      Vibrate.feedback(FeedbackType.success);
      widget.onMore?.call();
    } else if (offset <= -0.5) {
      Vibrate.feedback(FeedbackType.success);
      widget.onLess?.call();
    }

    _animationController.animateWith(SpringSimulation(
        springDescription, _animationController.value, 0.0, 0.0));
  }

  double _globalPositionToLocal(Offset globalPosition) {
    final renderBox = context.findRenderObject() as RenderBox;
    final local = renderBox.globalToLocal(globalPosition);

    final currentOffset = (local.dx / renderBox.size.width);
    final middleOffset = ((renderBox.size.width / 2) / renderBox.size.width);
    final offset = currentOffset - middleOffset;
    if(offset > 0.5) {
      return 0.5;
    } else if(offset < -0.5) {
      return -0.5;
    } else {
      return offset;
    }
  }
}
