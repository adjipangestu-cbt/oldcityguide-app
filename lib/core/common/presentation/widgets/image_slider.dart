import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;
  const ImageSlider({super.key, required this.images});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            enlargeCenterPage: false,
            enlargeFactor: 0.3,
            pageSnapping: true,
            viewportFraction: 0.84,
            onPageChanged: (value, _) {
              setState(() {
                _currentIndex = value;
              });
            },
          ),
          itemCount: widget.images.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            final imageUrl = widget.images[itemIndex].toString();
            final isLocalAsset = imageUrl.startsWith('assets/');
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              width: fullWidth * 0.80,
              child: isLocalAsset
                  ? Image.asset(
                      imageUrl,
                      width: fullWidth * 0.80,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imageUrl,
                      width: fullWidth * 0.80,
                      fit: BoxFit.cover,
                    ),
            );
          },
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (dotIndex) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentIndex == dotIndex ? Colors.blue : Colors.grey[400],
              ),
            );
          }),
        ),
      ],
    );
  }
}
