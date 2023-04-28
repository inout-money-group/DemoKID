import 'package:injectable/injectable.dart';
import 'package:kid_demo/core/models/kid.dart';
import 'package:kid_demo/data/local_datasource.dart';
import 'package:kid_demo/data/rest_datasource.dart';

@lazySingleton
class KIDRepository {
  KIDRepository(
    this._restDatasource,
    this._localDatasource,
  );

  final RestDatasource _restDatasource;
  final LocalDatasource _localDatasource;

  Future<KID> generateKID() async {
    final uid = await _localDatasource.getUID();
    final kid = await _restDatasource.getKid(uid: uid);

    await _localDatasource.saveKID(kid);

    return kid;
  }
}
