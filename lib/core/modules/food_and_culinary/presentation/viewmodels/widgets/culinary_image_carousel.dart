import 'package:flutter/material.dart';

/// Carousel foto yang bisa digeser kiri-kanan dengan tombol panah.
/// Aman untuk daftar foto kosong atau hanya 1 foto.
class CulinaryImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;

  const CulinaryImageCarousel({
    super.key,
    required this.imageUrls,
    this.height = 280,
  });

  @override
  State<CulinaryImageCarousel> createState() => _CulinaryImageCarouselState();
}

class _CulinaryImageCarouselState extends State<CulinaryImageCarousel> {
  late final PageController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildImage(String path) {
    return Image.asset(
      path,
      width: double.infinity,
      height: widget.height,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        width: double.infinity,
        height: widget.height,
        color: Colors.grey[300],
        child: const Icon(Icons.fastfood, size: 60, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final urls = widget.imageUrls;

    if (urls.isEmpty) {
      return Container(
        height: widget.height,
        color: Colors.grey[300],
        child: const Center(
          child: Icon(Icons.fastfood, size: 60, color: Colors.grey),
        ),
      );
    }

    if (urls.length == 1) {
      return SizedBox(height: widget.height, child: _buildImage(urls.first));
    }

    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // PageView utama
          PageView.builder(
            controller: _controller,
            itemCount: urls.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => _buildImage(urls[i]),
          ),

          // Indikator titik
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(urls.length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _current == i ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == i
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),

          // Tombol panah kiri
          if (_current > 0)
            Positioned(
              left: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () => _goTo(_current - 1),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.45),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),

          // Tombol panah kanan
          if (_current < urls.length - 1)
            Positioned(
              right: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () => _goTo(_current + 1),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.45),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
