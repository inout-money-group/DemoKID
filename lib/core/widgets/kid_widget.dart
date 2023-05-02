import 'package:flutter/material.dart';
import 'package:kid_demo/core/models/kid.dart';

class KIDWidget extends StatelessWidget {
  const KIDWidget({super.key, required this.kid});

  final KID kid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('kidPubliczny:', style: Theme.of(context).textTheme.subtitle2),
        Text(kid.pub),
        const SizedBox(height: 4),
        Text('kidPrywatny:', style: Theme.of(context).textTheme.subtitle2),
        Text(kid.pub),
        const SizedBox(height: 6),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Powrót'),
          ),
        ),
      ],
    );
  }
}
