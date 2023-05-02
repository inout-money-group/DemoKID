import 'package:dio/dio.dart';
import 'package:kid_demo/core/models/kid.dart';
import 'package:retrofit/http.dart';

part 'rest_datasource.g.dart';

@RestApi(baseUrl: "https://dev.ocr.inout.money")
abstract class RestDatasource {
  factory RestDatasource(Dio dio, {String baseUrl}) = _RestDatasource;

  @GET("/api/v1/mf/kid")
  Future<KID> getKid({
    @Header("Content-Type") String contentType = "application/json",
    @Header("UID") required String uid,
    @Query("width") int? width = 1080,
  });
}
