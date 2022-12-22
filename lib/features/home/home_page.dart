// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_demo/core/widgets/barcode_widget.dart';
import 'package:kid_demo/features/home/cubit/home_cubit.dart';
import 'package:kid_demo/features/receive_kid/cubit/receive_kid_cubit.dart';
import 'package:kid_demo/features/receive_kid/receive_kid_page.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/widgets/copy_field.dart';
import 'cubit/view_kid_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewKidCubit viewKidCubit = context.read();

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          receivedFile: (file) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ReceiveKidCubit(),
                child: ReceiveKidPage(
                  receivedFile: file,
                  viewKidCubit: viewKidCubit,
                ),
              ),
            ),
          ),
          orElse: () => null,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: context.read<ViewKidCubit>().refresh,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<ViewKidCubit, ViewKidState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Text(
                            'Ładowanie identyfikatora KID...',
                          ),
                        ),
                        loaded: (kid) {
                          if (kid == null) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 32),
                              child: Text(
                                'Nie dodałeś jeszcze identyfikatora KID, lub nie udało się go załadować.',
                              ),
                            );
                          }

                          return Column(children: [
                            BarcodeWidget(kid: kid),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                onPressed: () => _shareKid(context),
                                child: const Text('UDOSTĘPNIJ KID'),
                              ),
                            ),
                          ]);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.read<HomeCubit>().generateKid();
                        viewKidCubit.refresh();
                      },
                      child: const Text('POBIERZ KID'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.read<HomeCubit>().deleteKid();
                        viewKidCubit.refresh();
                      },
                      child: const Text('USUŃ KID'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
            Text(
              'Aby uzyskać dostęp do e-paragonów skojarzonych z Twoim identyfikatorem KID w innej aplikacji:\n1. Skopiuj do schowka poniższe hasło.\n2. Kliknij na przycisk UDOSTĘPNIJ.\n3. Wybierz aplikację, której chcesz udostępnić zaszyfrowany plik z identyfikatorem KID.\n4. Po uruchomieniu się wybranej aplikacji wklej skopiowane hasło.\n\nHasło:\n',
              style: Theme.of(context).textTheme.bodyText2,
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
            },
            child: const Text('UDOSTĘPNIJ'),
          ),
        ],
      ),
    );
  }
}
