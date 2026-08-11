import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String text;
  final Function onTap;
  const MenuItem({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      color: backgroundColor,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          width: 62,
          height: 82,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: Colors.white, size: 24),
                Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 8, color: Colors.white),
                    softWrap: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
