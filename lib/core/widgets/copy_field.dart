import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyField extends StatelessWidget {
  const CopyField({super.key, required this.textToCopy});

  final String textToCopy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: Colors.black26,
          )),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Text(textToCopy),
          const Spacer(),
          const ColoredBox(
            color: Colors.black26,
            child: SizedBox(width: 1),
          ),
          IconButton(
            icon: const Icon(Icons.copy),
            padding: const EdgeInsets.all(0),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: textToCopy));
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Skopiowano do schowka')),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
