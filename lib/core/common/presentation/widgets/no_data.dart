import 'package:flutter/widgets.dart';
import 'package:oldcityguideapp/core/ui/typoghrapy.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/no_data_image.png'),
        Text(
          "Tidak ada data yang ditemukan",
          style: AppTypoghrapy.subTitle,
        ),
      ],
    );
  }
}
