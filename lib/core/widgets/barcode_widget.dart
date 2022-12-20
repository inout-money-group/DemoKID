// ignore_for_file: use_build_context_synchronously

import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kid_demo/core/models/kid.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/home/cubit/home_cubit.dart';
import 'copy_field.dart';

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
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () => _shareKid(context),
            child: const Text('UDOSTĘPNIJ KID'),
          ),
        ],
      ),
    );
  }

  Future<void> _shareKid(BuildContext context) async {
    final kidShare = await context.read<HomeCubit>().getEncryptedKid();
    if (kidShare == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nie udało się udostępnić identyfikatora KID. Upewnij się, że wygenerowałeś identyfikator.',
          ),
        ),
      );

      return;
    }

    await showGeneralDialog(
      context: context,
      pageBuilder: (context, _, __) => AlertDialog(
        title: const Text('Udostępnienie identyfikatora KID'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Aby uzyskać dostęp do e-paragonów skojarzonych z Twoim identyfikatorem KID w innej aplikacji:\n1. Skopiuj do schowka poniższe hasło.\n2. Kliknij na przycisk UDOSTĘPNIJ.\n3. Wybierz aplikację, której chcesz udostępnić zaszyfrowany plik z identyfikatorem KID.\n4. Po uruchomieniu się wybranej aplikacji wklej skopiowane hasło.\n\nHasło:\n',
            ),
            CopyField(textToCopy: kidShare.encryptionKey),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ANULUJ'),
          ),
          TextButton(
            onPressed: () async {
              final fileToShare = XFile(kidShare.encryptedFile.path);
              await Share.shareXFiles([fileToShare]);
              Navigator.pop(context);
              kidShare.encryptedFile.delete();
            },
            child: const Text('UDOSTĘPNIJ'),
          ),
        ],
      ),
    );
  }
}
