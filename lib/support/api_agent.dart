import 'package:dio/dio.dart';

class ApiAgent {
  // Static options for Dio client initialization.
  static final BaseOptions baseOptions = BaseOptions(
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    followRedirects: true,
    headers: {
      "Accept": "application/json",
    },
    validateStatus: (status) {
      return status == 200 || status == 422 || status == 401 || status == 500;
    },
    baseUrl: 'https://trogon.info/interview/php/api/',
  );
// Static Dio instance initialized with base options.
  static Dio dio = Dio(baseOptions);

  /// Perform a POST request with optional authorization and file upload.
  ///
  /// **Description:**
  /// Sends a POST request to the specified [url] with the provided [params].
  /// Optionally includes authorization token and handles multipart file upload.
  ///
  /// **Parameters:**
  /// - [String] `url`: The endpoint URL for the POST request.
  /// - [bool] `authorization`: Flag indicating whether authorization is required.
  /// - [bool] `hasFile`: Flag indicating whether the request includes a file upload.
  ///
  /// Returns a [Future] that resolves to a [Response] object containing the server's response.
  ///
  /// Throws a [DioException] if the request fails.
  ///
  /// Example:
  /// ```dart
  /// await ApiAgent.post(
  ///   url: '/send_otp',
  ///   params: {'phone': '911234567890'},
  /// );
  /// ```
  static Future<Response> post({
    required String url,
    required dynamic params,
    bool authorization = true,
    bool hasFile = false,
    CancelToken? cancelToken,
  }) async {
    // Modify headers if authorization is required and token is available.
    // Set headers for Dio instance.
    dio.options.headers = {
      "Accept": "application/json", // Ensure JSON response is accepted.
      "Content-Type": "application/json"
    };
    if (hasFile) {
      dio.options.headers["Content-type"] = "multipart/form-data"; // Set content type for file upload.
    }

    try {
      // Perform POST request using Dio instance.
      Response response = await dio.post(url, data: params, cancelToken: cancelToken);

      return response; // Return the server's response.
    } catch (e) {
      // Rethrow any exception encountered during request.
      rethrow;
    }
  }
}
