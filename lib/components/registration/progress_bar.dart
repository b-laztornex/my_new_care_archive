import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {super.key,
      this.color = const Color(0xFF2DBD3A),
      required this.step,
      this.cw = 40,
      this.ch = 40,
      this.fz = 16});

  final Color color;
  final num step;
  final double cw;
  final double ch;
  final double fz;

  Widget progressIcon(cstep, filled) {
    return Container(
      width: cw,
      height: ch,
      decoration: BoxDecoration(
          color: filled ? const Color(0xffFFDE58) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(5.0, 5.0),
            )
          ],
          borderRadius: BorderRadius.circular(50.0)),
      child: Center(
        child: Text(
          cstep,
          style: TextStyle(
              fontSize: fz, color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width / 2,
      child: Stack(
        children: [
          Positioned(
            top: ch / 2,
            child: Container(
              color: const Color(0xff7A7575),
              width: MediaQuery.of(context).size.width,
              height: 2.0,
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                progressIcon('1', 0 <= step),
                progressIcon('2', 1 <= step),
                progressIcon('3', 2 <= step),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
