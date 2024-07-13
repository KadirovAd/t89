
import 'package:flutter/material.dart';

class CantainerAddPr extends StatelessWidget {
  const CantainerAddPr({
    super.key,
    required this.text1,
    required this.text2,
    required this.colors,
  });
  final String text1;
  final String text2;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 44,
            width: 150,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF262A46)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ),
            child: Center(
              child: Text(
                text1,
                style: const TextStyle(
                  color: Color(0xFF535778),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 44,
            width: 140,
            decoration: ShapeDecoration(
              color: colors,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            child: Center(
              child: Text(
                text2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
