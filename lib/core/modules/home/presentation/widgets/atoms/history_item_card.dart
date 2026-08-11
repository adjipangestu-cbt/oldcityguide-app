import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oldcityguideapp/core/extension/widget.dart';
import 'package:oldcityguideapp/core/ui/button.dart';

class ItemCard extends StatelessWidget {
  final String desc;
  final String title;
  final String imageUrl;
  final Function onTap;
  const ItemCard(
      {super.key,
      required this.desc,
      required this.title,
      required this.onTap,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        width: 254,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 254,
              height: 254,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ).pading(
              const EdgeInsets.symmetric(horizontal: 8),
            ),
            Flexible(
              child: Text(
                desc,
                softWrap: true,
              ).pading(const EdgeInsets.symmetric(horizontal: 8)),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: AppButton.primaryButton,
              onPressed: () => onTap(),
              iconAlignment: IconAlignment.end,
              icon: FaIcon(
                FontAwesomeIcons.arrowRight,
                color: Colors.white,
              ),
              label: Text("Selengkapnya"),
            ).pading(
              const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 12),
            ),
          ],
        ),
      ),
    );
  }
}
