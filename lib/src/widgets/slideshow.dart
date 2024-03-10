import 'package:background_custom_painters/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool pointsUp;
  final Color pointsEnabledColor;
  final Color pointsDisableColor;
  final int pointActiveHeightAndWidth;
  final int pointDisableHeightAndWidth;

  const Slideshow({
    super.key,
    required this.slides,
    this.pointsUp = false,
    this.pointsEnabledColor = Colors.blue,
    this.pointsDisableColor = Colors.grey,
    this.pointActiveHeightAndWidth  = 16,
    this.pointDisableHeightAndWidth = 12
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child :  SafeArea(
        child: Center(
          child : Column(
            children: [
              if(pointsUp) _Dots(slidesNumber: slides.length, pointsEnabledColor: pointsEnabledColor,pointsDisableColor:pointsDisableColor, pointActiveHeightAndWidth: pointActiveHeightAndWidth, pointDisableHeightAndWidth: pointDisableHeightAndWidth),
              Expanded(
                child: _Slides(slides: slides)
              ),
              if(!pointsUp) _Dots(slidesNumber: slides.length, pointsEnabledColor: pointsEnabledColor,pointsDisableColor:pointsDisableColor, pointActiveHeightAndWidth: pointActiveHeightAndWidth, pointDisableHeightAndWidth: pointDisableHeightAndWidth),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int slidesNumber;
  final Color pointsEnabledColor;
  final Color pointsDisableColor;
  final int pointActiveHeightAndWidth;
  final int pointDisableHeightAndWidth;
  
  const _Dots({
    required this.slidesNumber,
    required this.pointsEnabledColor,
    required this.pointsDisableColor,
    required this.pointActiveHeightAndWidth,
    required this.pointDisableHeightAndWidth
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(slidesNumber, (i) => _Dot( //CREA UNA LISTA DE ELEMENTOS CON BASE EN EL NUMERO QUE SE NECESITE
          index: i, 
          pointsEnabledColor: pointsEnabledColor,
          pointsDisableColor: pointsDisableColor,
          pointActiveHeightAndWidth : pointActiveHeightAndWidth,
          pointDisableHeightAndWidth: pointDisableHeightAndWidth,
        ))
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color pointsEnabledColor;
  final Color pointsDisableColor;
  final int pointActiveHeightAndWidth;
  final int pointDisableHeightAndWidth;

  const _Dot({
    required this.index,
    required this.pointsEnabledColor,
    required this.pointsDisableColor,
    required this.pointActiveHeightAndWidth,
    required this.pointDisableHeightAndWidth
  });

  @override
  Widget build(BuildContext context) {
    final double pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width : (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)  ? pointActiveHeightAndWidth.toDouble() : pointDisableHeightAndWidth.toDouble(),
      height: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) ? pointActiveHeightAndWidth.toDouble() : pointDisableHeightAndWidth.toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) ? pointsEnabledColor : pointsDisableColor
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  
  const _Slides({
    required this.slides
  });

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  
  final PageController pageViewController = PageController();
  
  @override
  void initState() {
    pageViewController.addListener(() { 
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _ImageSlide(slide: slide)).toList()
      ),
    );
  }
}

class _ImageSlide extends StatelessWidget {
  final Widget slide;

  const _ImageSlide({
    required this.slide
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : const EdgeInsets.all(20),
      width : double.infinity,
      height: double.infinity,
      child : slide
    );
  }
}