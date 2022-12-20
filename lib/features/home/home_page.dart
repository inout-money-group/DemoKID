// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kid_demo/core/widgets/barcode_widget.dart';
import 'package:kid_demo/features/home/cubit/home_cubit.dart';
import 'package:kid_demo/features/receive_kid/cubit/receive_kid_cubit.dart';
import 'package:kid_demo/features/receive_kid/receive_kid_page.dart';

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
                children: [
                  BlocBuilder<ViewKidCubit, ViewKidState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const Text(
                          'Ładowanie identyfikatora KID...',
                        ),
                        loaded: (kid) {
                          if (kid == null) {
                            return const Text(
                              'Nie dodałeś jeszcze identyfikatora KID, lub nie udało się go załadować.',
                            );
                          }

                          return BarcodeWidget(kid: kid);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await context.read<HomeCubit>().generateKid();
                            viewKidCubit.refresh();
                          },
                          child: const Text('POBIERZ KID'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await context.read<HomeCubit>().deleteKid();
                            viewKidCubit.refresh();
                          },
                          child: const Text('USUŃ KID'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
