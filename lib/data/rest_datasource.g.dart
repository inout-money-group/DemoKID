// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestDatasource implements RestDatasource {
  _RestDatasource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://dev.ocr.inout.money';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<KID> getKid({
    String contentType = "application/json",
    required String uid,
    int? width = 1080,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'width': width};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'UID': uid,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<KID>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              '/api/v1/mf/kid',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KID.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
