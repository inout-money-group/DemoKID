import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/kid.dart';

part 'view_kid_state.dart';
part 'view_kid_cubit.freezed.dart';

class ViewKidCubit extends Cubit<ViewKidState> {
  ViewKidCubit() : super(const ViewKidState.initial()) {
    refresh();
  }

  Future<void> refresh() async {
    emit(const ViewKidState.initial());
    KID? kid;
    final string = await const FlutterSecureStorage().read(key: 'kid');
    if (string != null) {
      kid = KID.fromJson(jsonDecode(string));
    }

    emit(ViewKidState.loaded(kid: kid));
  }
}
