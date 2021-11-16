import 'package:flutter/material.dart';

class TouchableWidget extends StatelessWidget {
  final BoxDecoration? decoration;
  final Function? onPressed;
  final Widget? child;
  final BorderRadiusGeometry? borderRadiusEffect;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;

  const TouchableWidget(
      {Key? key,
      this.decoration,
      this.onPressed,
      this.borderRadiusEffect,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: decoration ??
          const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: const Color.fromRGBO(204, 223, 242, 0.2),
          splashColor: const Color.fromRGBO(204, 223, 242, 0.4),
          customBorder: RoundedRectangleBorder(
              borderRadius: borderRadiusEffect ??
                  decoration?.borderRadius ??
                  const BorderRadius.all(Radius.circular(6))),
          onTap: () => onPressed!(),
          child: child,
        ),
      ),
    );
  }
}
