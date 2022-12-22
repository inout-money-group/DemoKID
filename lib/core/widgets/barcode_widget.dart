// ignore_for_file: use_build_context_synchronously

import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kid_demo/core/models/kid.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({super.key, required this.kid});

  final KID kid;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final barcode = Barcode.code128();
    final bcSvg = barcode.toSvg(
      kid.kidPubliczny,
      width: maxWidth * 0.6,
      fontFamily: 'Lato',
    );

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SvgPicture.string(bcSvg),
        ],
      ),
    );
  }
}
