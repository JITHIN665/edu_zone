import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:edu_zone/infrastructure/home/models/modules.dart';
import 'package:edu_zone/infrastructure/home/models/subjects.dart';
import 'package:edu_zone/infrastructure/home/models/videos.dart';
import 'package:edu_zone/support/api_agent.dart';

class HomeRepository {
  /// Retrieve Subjects List
  ///
  /// **Description:**
  /// Fetches a list of subjects by making an API request to the 'subjects.php' endpoint.
  /// This function handles the API call, processes the response, and converts the data into
  /// a list of [Subjects] objects.
  ///
  /// **Workflow:**
  /// 1. Prepares API parameters.
  /// 2. Makes a POST request to the API endpoint.
  /// 3. Handles different response data formats:
  ///    - A list of subject objects directly.
  ///    - A map containing a 'data' field with a list of subjects.
  ///    - A raw JSON string representing one of the above formats.
  /// 4. Parses the response into a list of [Subjects].
  ///
  /// **Returns:**
  /// - [Future<List<Subjects>>]: A future that resolves to a list of [Subjects] objects
  ///   representing the retrieved data.
  ///
  /// **Throws:**
  /// - Any exceptions encountered during the API request are rethrown for further handling
  ///   by the calling code.
  Future<List<Subjects>> listSubjects() async {
    List<Subjects> subjects = [];
    try {
      // Prepare parameters for the API request
      Map<String, dynamic> params = {};

      // Make the API call
      Response response = await ApiAgent.post(
        url: 'subjects.php',
        params: params,
        hasFile: false,
      );

      // Handle the response based on its data type
      if (response.data is List) {
        // If the response is already a List, parse directly into Subjects
        subjects = (response.data as List).map((item) => Subjects.fromJson(item as Map<String, dynamic>)).toList();
      } else if (response.data is Map && response.data['data'] is List) {
        // If the response is a Map with a 'data' field containing a List
        subjects = (response.data['data'] as List).map((item) => Subjects.fromJson(item as Map<String, dynamic>)).toList();
      } else if (response.data is String) {
        // If the response is a raw JSON string, decode it
        final dynamic jsonResponse = jsonDecode(response.data);

        if (jsonResponse is List) {
          // If the decoded JSON is a List
          subjects = jsonResponse.map((item) => Subjects.fromJson(item as Map<String, dynamic>)).toList();
        } else if (jsonResponse is Map && jsonResponse['data'] is List) {
          // If the decoded JSON is a Map with a 'data' field containing a List
          subjects = (jsonResponse['data'] as List).map((item) => Subjects.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          // If the decoded JSON is in an unexpected format
          throw Exception("Unexpected response format after decoding JSON");
        }
      } else {
        // If the response is in an unexpected format
        throw Exception("Unexpected response format");
      }
    } catch (error) {
      // Log the error for debugging purposes
      print("Error fetching subjects: $error");

      // Rethrow the exception to allow the calling code to handle it
      rethrow;
    }

    // Return the parsed list of Subjects
    return subjects;
  }

  /// Retrieve Modules List
  ///
  /// **Description:**
  /// Fetches a list of modules associated with a specific subject by making an API
  /// request to the 'modules.php' endpoint. This function handles the API call,
  /// processes the response, and converts the data into a list of [Modules] objects.
  ///
  /// **Workflow:**
  /// 1. Prepares API parameters with the `subjectId`.
  /// 2. Makes a POST request to the API endpoint using the `ApiAgent`.
  /// 3. Handles different response formats:
  ///    - A direct list of module objects.
  ///    - A map containing a 'data' field with a list of modules.
  ///    - A raw JSON string representing one of the above formats.
  /// 4. Parses the response into a list of [Modules] objects.
  ///
  /// **Parameters:**
  /// - `subjectId` (required): The ID of the subject for which modules need to be fetched.
  ///
  /// **Returns:**
  /// - [Future<List<Modules>>]: A future that resolves to a list of [Modules] objects
  ///   representing the retrieved data.
  ///
  /// **Throws:**
  /// - Any exceptions encountered during the API request or response parsing are rethrown
  ///   for further handling by the calling code.
  Future<List<Modules>> listmodules({required int subjectId}) async {
    // Initialize an empty list to store the modules
    List<Modules> modules = [];

    try {
      // Prepare parameters for the API request
      Map<String, dynamic> params = {
        'subject_id': subjectId, // Pass the subject ID as a parameter
      };

      // Make the API call to the 'modules.php' endpoint
      Response response = await ApiAgent.post(
        url: 'modules.php',
        params: params,
        hasFile: false, // Indicate no files are included in the request
      );

      // Handle different response formats
      if (response.data is List) {
        // If the response is a List, directly parse into Modules
        modules = (response.data as List).map((item) => Modules.fromJson(item as Map<String, dynamic>)).toList();
      } else if (response.data is Map && response.data['data'] is List) {
        // If the response is a Map containing a 'data' field with a List
        modules = (response.data['data'] as List).map((item) => Modules.fromJson(item as Map<String, dynamic>)).toList();
      } else if (response.data is String) {
        // If the response is a raw JSON string, decode it
        final dynamic jsonResponse = jsonDecode(response.data);

        if (jsonResponse is List) {
          // If the decoded JSON is a List
          modules = jsonResponse.map((item) => Modules.fromJson(item as Map<String, dynamic>)).toList();
        } else if (jsonResponse is Map && jsonResponse['data'] is List) {
          // If the decoded JSON is a Map with a 'data' field containing a List
          modules = (jsonResponse['data'] as List).map((item) => Modules.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          // If the decoded JSON is in an unexpected format
          throw Exception("Unexpected response format after decoding JSON");
        }
      } else {
        // If the response is in an unexpected format
        throw Exception("Unexpected response format");
      }
    } catch (error) {
      // Log the error for debugging purposes
      print("Error fetching modules: $error");

      // Rethrow the exception to allow the calling code to handle it
      rethrow;
    }

    // Return the parsed list of Modules
    return modules;
  }

  /// Retrieve Videos List
  ///
  /// **Description:**
  /// Fetches a list of videos associated with a specific module by making an API
  /// request to the 'videos.php' endpoint. This function handles the API call,
  /// processes the response, and converts the data into a list of [Videos] objects.
  ///
  /// **Workflow:**
  /// 1. Prepares API parameters with the `moduleId`.
  /// 2. Makes a POST request to the API endpoint using the `ApiAgent`.
  /// 3. Handles different response formats:
  ///    - A direct list of video objects.
  ///    - A map containing a 'data' field with a list of videos.
  ///    - A raw JSON string representing one of the above formats.
  /// 4. Parses the response into a list of [Videos] objects.
  ///
  /// **Parameters:**
  /// - `moduleId` (required): The ID of the module for which videos need to be fetched.
  ///
  /// **Returns:**
  /// - [Future<List<Videos>>]: A future that resolves to a list of [Videos] objects
  ///   representing the retrieved data.
  ///
  /// **Throws:**
  /// - Any exceptions encountered during the API request or response parsing are rethrown
  ///   for further handling by the calling code.
  Future<List<Videos>> listVideos({required int moduleId}) async {
    // Initialize an empty list to store the videos
    List<Videos> videos = [];

    try {
      // Prepare parameters for the API request
      Map<String, dynamic> params = {
        'moduleId': moduleId, // Pass the module ID as a parameter
      };

      // Make the API call to the 'videos.php' endpoint
      Response response = await ApiAgent.post(
        url: 'videos.php',
        params: params,
        hasFile: false, // Indicate no files are included in the request
      );

      // Handle different response formats
      if (response.data is List) {
        // If the response is a List, directly parse into Videos
        videos = (response.data as List).map((item) => Videos.fromJson(item as Map<String, dynamic>)).toList();
      } else if (response.data is Map && response.data['data'] is List) {
        // If the response is a Map containing a 'data' field with a List
        videos = (response.data['data'] as List).map((item) => Videos.fromJson(item as Map<String, dynamic>)).toList();
      } else if (response.data is String) {
        // If the response is a raw JSON string, decode it
        final dynamic jsonResponse = jsonDecode(response.data);

        if (jsonResponse is List) {
          // If the decoded JSON is a List
          videos = jsonResponse.map((item) => Videos.fromJson(item as Map<String, dynamic>)).toList();
        } else if (jsonResponse is Map && jsonResponse['data'] is List) {
          // If the decoded JSON is a Map with a 'data' field containing a List
          videos = (jsonResponse['data'] as List).map((item) => Videos.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          // If the decoded JSON is in an unexpected format
          throw Exception("Unexpected response format after decoding JSON");
        }
      } else {
        // If the response is in an unexpected format
        throw Exception("Unexpected response format");
      }
    } catch (error) {
      // Log the error for debugging purposes
      print("Error fetching videos: $error");

      // Rethrow the exception to allow the calling code to handle it
      rethrow;
    }

    // Return the parsed list of Videos
    return videos;
  }
}
