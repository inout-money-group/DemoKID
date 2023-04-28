// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kid_demo/core/models/kid.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({super.key, required this.kid});

  final KID kid;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final barcodeDecoded = base64Decode(kid.pngBase64);
    final bcPng = Image.memory(
      barcodeDecoded,
      width: maxWidth * 0.8,
    );

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          bcPng,
        ],
      ),
    );
  }
}
