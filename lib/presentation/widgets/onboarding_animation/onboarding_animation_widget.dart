library onboarding_animation;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_lover/common/app_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingAnimation extends StatefulWidget {
  /// This parameter is required. need to provide list of [Widget] user wants to show on onBoarding.
  final List<Widget> pages;

  /// This parameter is used to set the offset of the indicator.
  final double indicatorOffset;

  /// Set the width of the the indicator's dot.
  final double indicatorDotWidth;

  /// Set the height of indicator's dot.
  final double indicatorDotHeight;

  /// Using this parameter user can define the space between the dots of indicator.
  final double indicatorDotSpacing;

  /// Is use to set the radius of the circle shown in the indicator.
  final double indicatorDotRadius;

  /// This is use to set the color of the inactive(unselected) dot color.
  final Color indicatorInActiveDotColor;

  /// This is use to set the color of the active(selected) dot color.
  final Color indicatorActiveDotColor;

  /// [indicatorStrokeWidth] is use to set the width of the stroke if the [PaintStyle] is selected to the stroke.
  final double indicatorStrokeWidth;

  /// [indicatorExpansionFactor] is multiplied by [indicatorDotWidth] to resolve
  /// the width of the expanded dot.
  final double indicatorExpansionFactor;

  /// The maximum scale the dot will hit while jumping.
  final double indicatorJumpScale;

  /// The vertical offset of the jumping dot.
  final double indicatorVerticalOffset;

  /// [indicatorPaintStyle] is use to select between the fill and the stroke style.
  final PaintingStyle indicatorPaintStyle;

  /// [indicatorWormType] helps to select the form of the [WormType] between normal and thin.
  final WormType indicatorWormType;

  /// [indicatorSwapType] helps to select the form of the [SwapType] between normal, yRotation and zRotation.
  final SwapType indicatorSwapType;

  /// Inactive dots paint style (fill/stroke) defaults to fill.
  final PaintingStyle indicatorActivePaintStyle;

  /// This is ignored if [indicatorActivePaintStyle] is PaintStyle.fill.
  final double indicatorActiveStrokeWidth;

  /// [indicatorScale] is multiplied by [indicatorDotWidth] to resolve
  /// active dot scaling.
  final double indicatorScale;

  /// [indicatorActiveDotScale] is multiplied by [indicatorDotWidth] to resolve
  /// active dot scaling.
  final double indicatorActiveDotScale;

  /// The max number of dots to display at a time
  /// if count is <= [maxVisibleDots] [indicatorMaxVisibleDots] = count
  /// must be an odd number that's >= 5.
  final int indicatorMaxVisibleDots;

  /// If True the old center dot style will be used.
  final bool indicatorFixedCenter;

  /// [indicatorInActiveDotDecoration] is used to set the inactive dot decoration if [indicatorType] is selected to custom.
  final DotDecoration? indicatorInActiveDotDecoration;

  /// [indicatorActiveDotDecoration] is used to set the active dot decoration if [indicatorType] is selected to custom.
  final DotDecoration? indicatorActiveDotDecoration;

  /// This parameter is use to override the existing active and inactive colors.
  final ColorBuilder? indicatorActiveColorOverride, indicatorInActiveColorOverride;

  const OnBoardingAnimation({
    required this.pages,
    this.indicatorOffset = 10.0,
    this.indicatorDotWidth = 10.0,
    this.indicatorDotHeight = 10.0,
    this.indicatorDotSpacing = 8.0,
    this.indicatorDotRadius = 11.0,
    this.indicatorJumpScale = 1.4,
    this.indicatorVerticalOffset = 0.0,
    this.indicatorInActiveDotColor = Colors.grey,
    this.indicatorActiveDotColor = Colors.black,
    this.indicatorPaintStyle = PaintingStyle.fill,
    this.indicatorActivePaintStyle = PaintingStyle.fill,
    this.indicatorScale = 1.4,
    this.indicatorActiveDotScale = 1.3,
    this.indicatorMaxVisibleDots = 5,
    this.indicatorFixedCenter = false,
    this.indicatorActiveStrokeWidth = 1.0,
    this.indicatorExpansionFactor = 3.0,
    this.indicatorStrokeWidth = 1.0,
    this.indicatorWormType = WormType.normal,
    this.indicatorSwapType = SwapType.normal,
    this.indicatorInActiveDotDecoration,
    this.indicatorActiveDotDecoration,
    this.indicatorActiveColorOverride,
    this.indicatorInActiveColorOverride,
    Key? key,
  }) : super(key: key);

  @override
  _OnBoardingAnimationState createState() => _OnBoardingAnimationState();
}

class _OnBoardingAnimationState extends State<OnBoardingAnimation> {
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<double> _pageIndex = ValueNotifier(0.0);

  /// Initialize the listener to add page listener.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _pageController.addListener(_listener);
    });
  }

  /// For disposing the PageController and removing the page listener.
  @override
  void dispose() {
    super.dispose();
    _pageController.removeListener(_listener);
    _pageController.dispose();
  }

  /// Main body for onBoarding animation.
  @override
  Widget build(BuildContext context) {
    // Timer.periodic(const Duration(seconds: 3), (timer) {
    //   if (_pageIndex.value == widget.pages.length - 1) {
    //     _pageIndex.value = 0.toDouble();
    //   } else {
    //     _pageIndex.value++;
    //   }
    // });
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ValueListenableBuilder<double>(
            builder: (_, indexValue, __) {
              return PageView.builder(
                itemCount: widget.pages.length,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  /// TweenAnimationBuilder to smoothen the animation.
                  return TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 140),
                    tween: Tween<double>(
                      begin: ((((index - indexValue) * 100.0) * ((index - indexValue).abs() / 40)) / 100.0),
                      end: ((((index - indexValue) * 100.0) * ((index - indexValue).abs() / 40)) / 100.0),
                    ),
                    builder: (_, double rotation, _child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, .1)
                          ..rotateY(rotation),
                        alignment: FractionalOffset.center,
                        child: widget.pages[index],
                      );
                    },
                  );
                },
                onPageChanged: (index) {
                  log('onChangePage');
                  log('index: $index');
                  _pageIndex.value = index.toDouble();
                },
              );
            },
            valueListenable: _pageIndex,
          ),
        ],
      ),
    );
  }

  /// This method listen to the page changes to give the position value of the pages using [PageController].
  void _listener() {
    _pageIndex.value = _pageController.page!;
  }
}
