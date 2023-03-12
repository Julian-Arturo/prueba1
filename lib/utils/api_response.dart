class HttpResponse<T> {
  final T? data;
  final HttpError? error;
  HttpResponse({
    required this.data,
    required this.error,
  });

  static HttpResponse<T> succes<T>(T data) =>
      HttpResponse<T>(error: null, data: data);

  factory HttpResponse.failed({
    required int? statusCode,
    required String? message,
    required dynamic data,
  }) =>
      HttpResponse(
        data: null,
        error: HttpError(
          data: data,
          message: message,
          statusCode: statusCode,
        ),
      );
}

class HttpError {
  final int? statusCode;
  final String? message;
  final dynamic data;
  HttpError({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}