import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_demo/core/widgets/kid_widget.dart';
import 'package:kid_demo/features/home/cubit/view_kid_cubit.dart';

import 'cubit/receive_kid_cubit.dart';

class ReceiveKidPage extends StatelessWidget {
  const ReceiveKidPage({
    super.key,
    required this.receivedFile,
    required this.viewKidCubit,
  });

  final File receivedFile;
  final ViewKidCubit viewKidCubit;

  @override
  Widget build(BuildContext context) {
    context.read<ReceiveKidCubit>().receiveFile(receivedFile);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: BlocBuilder<ReceiveKidCubit, ReceiveKidState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(
                  child: Text('Nie udostępniono pliku .kid'),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
                received: (file) {
                  final controller = TextEditingController();
                  return Column(
                    children: [
                      Text(
                        'Otrzymanie identyfikatora KID',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Aby zapisać udostępniony identyfikator KID, wklej poniżej skopiowane wcześniej hasło i kliknij przycisk ZAPISZ.',
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.maxFinite,
                        child: TextField(
                          controller: controller,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () async {
                            final shouldProceed = await showGeneralDialog<bool>(
                                  context: context,
                                  pageBuilder: (context, _, __) => AlertDialog(
                                    title: const Text('Uwaga'),
                                    content: const Text(
                                      'Ta akcja zastąpi aktualnie zapisany w aplikacji identyfikator KID. Czy chcesz kontynuować?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                          context,
                                          false,
                                        ),
                                        child: const Text('ANULUJ'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                          context,
                                          true,
                                        ),
                                        child: const Text('TAK'),
                                      ),
                                    ],
                                  ),
                                ) ??
                                false;

                            if (!shouldProceed) return;

                            // ignore: use_build_context_synchronously
                            final result = await context
                                .read<ReceiveKidCubit>()
                                .decryptFile(
                                  controller.text,
                                  receivedFile,
                                );

                            if (!result) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Wystąpił błąd. Upewnij się, że podany klucz jest prawidłowy,',
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text('ZAPISZ'),
                        ),
                      )
                    ],
                  );
                },
                decrypted: (kid) {
                  viewKidCubit.refresh();

                  return KIDWidget(kid: kid);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
