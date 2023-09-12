import 'dart:io';

import 'package:cse_archive/app/constants/api_endpoints.dart';
import 'package:cse_archive/app/constants/sizes.dart';
import 'package:cse_archive/app/models/chart_node.dart';
import 'package:cse_archive/app/models/course.dart';
import 'package:cse_archive/app/models/course_type.dart';
import 'package:cse_archive/app/models/course_units.dart';
import 'package:cse_archive/app/models/professor.dart';
import 'package:cse_archive/app/models/professor_department.dart';
import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/reference_type.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:cse_archive/app/models/resource_type.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

Future<T?> _requestHandler<T>({
  required Future<dio.Response> Function() request,
  required int successStatusCode,
  required T? Function(dynamic json) successDecoder,
}) async {
  try {
    final response = await request();

    if (response.statusCode == successStatusCode) {
      return successDecoder(response.data);
    }

    return null;
  } on Exception catch (exception, stackTrace) {
    if (kDebugMode) {
      debugPrintStack(
        label: exception.toString(),
        stackTrace: stackTrace,
      );
    } else {
      // TODO:
      // Sentry.captureException(exception, stackTrace: stackTrace);
    }

    return null;
  } catch (error) {
    if (kDebugMode) {
      debugPrint(error.toString());
    } else {
      // TODO:
      // Sentry.captureMessage(error.toString(), level: SentryLevel.error);
    }

    return null;
  }
}

class APIService extends GetxService {
  static APIService get to => Get.find();

  final _client = dio.Dio(
    dio.BaseOptions(validateStatus: (_) => true),
  );

  Future<
      ({
        List<ResourceModel> resources,
        List<RecordedClassroomModel> recordings,
        List<ReferenceModel> references,
      })?> home() => _requestHandler(
        request: () => _client.get(ArchiveAPIEndpoints.home),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => (
          resources: ResourceModel.listFromJson(json['resources']),
          recordings: RecordedClassroomModel.listFromJson(json['recordings']),
          references: ReferenceModel.listFromJson(json['references']),
        ),
      );

  Future<
      ({
        List<CourseModel> courses,
        List<ProfessorModel> professors,
        List<ReferenceModel> references,
      })?> search({required String query}) => _requestHandler(
        request: () => _client.get(
          ArchiveAPIEndpoints.search,
          queryParameters: {'search': query},
        ),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => (
          courses: CourseModel.listFromJson(json['courses']),
          professors: ProfessorModel.listFromJson(json['professors']),
          references: ReferenceModel.listFromJson(json['references']),
        ),
      );

  Future<
      ({
        List<CourseModel> courses,
        bool isThereMore,
      })?> courses({
    CourseTypeModel? type,
    CourseUnitsModel? units,
    String? search,
    int? offset,
  }) =>
      _requestHandler(
        request: () => _client.get(
          ArchiveAPIEndpoints.courses,
          queryParameters: {
            'type': type?.toJson(),
            'units': units?.toJson(),
            'search': search,
            'offset': offset,
            'limit': kDataLimit,
          },
        ),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => (
          courses: CourseModel.listFromJson(json['results']),
          isThereMore: json['next'] != null,
        ),
      );

  Future<
      ({
        List<ReferenceModel> references,
        bool isThereMore,
      })?> references({
    ReferenceTypeModel? type,
    String? search,
    int? offset,
  }) =>
      _requestHandler(
        request: () => _client.get(
          ArchiveAPIEndpoints.references,
          queryParameters: {
            'type': type?.toJson(),
            'search': search,
            'offset': offset,
            'limit': kDataLimit,
          },
        ),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => (
          references: ReferenceModel.listFromJson(json['results']),
          isThereMore: json['next'] != null,
        ),
      );

  Future<
      ({
        List<ProfessorModel> professors,
        bool isThereMore,
      })?> professors({
    ProfessorDepartmentModel? department,
    String? search,
    int? offset,
  }) =>
      _requestHandler(
        request: () => _client.get(
          ArchiveAPIEndpoints.professors,
          queryParameters: {
            'department': department?.toJson(),
            'search': search,
            'offset': offset,
            'limit': kDataLimit,
          },
        ),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => (
          professors: ProfessorModel.listFromJson(json['results']),
          isThereMore: json['next'] != null,
        ),
      );

  Future<
      ({
        List<ResourceModel> resources,
        bool isThereMore,
      })?> resources({
    ResourceTypeModel? type,
    int? offset,
  }) =>
      _requestHandler(
        request: () => _client.get(
          ArchiveAPIEndpoints.resources,
          queryParameters: {
            'type': type?.toJson(),
            'offset': offset,
            'limit': kDataLimit,
          },
        ),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => (
          resources: ResourceModel.listFromJson(json['results']),
          isThereMore: json['next'] != null,
        ),
      );

  Future<
      ({
        List<RecordedClassroomModel> recordings,
        bool isThereMore,
      })?> recordings({int? offset}) => _requestHandler(
        request: () => _client.get(
          ArchiveAPIEndpoints.recordings,
          queryParameters: {
            'offset': offset,
            'limit': kDataLimit,
          },
        ),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => (
          recordings: RecordedClassroomModel.listFromJson(json['results']),
          isThereMore: json['next'] != null,
        ),
      );

  Future<List<ChartNodeModel>?> chart() => _requestHandler(
        request: () => _client.get(ArchiveAPIEndpoints.chart),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) => ChartNodeModel.listFromJson(json),
      );

  Future<List<ProfessorDepartmentModel>?> professorDepartments() =>
      _requestHandler(
        request: () => _client.get(
          ArchiveAPIEndpoints.departments,
          queryParameters: {'limit': 10000},
        ),
        successStatusCode: HttpStatus.ok,
        successDecoder: (json) =>
            ProfessorDepartmentModel.listFromJson(json['results']),
      );

  Future<CourseModel?> course({required String uuid}) => _requestHandler(
        request: () => _client.get(ArchiveAPIEndpoints.course(uuid)),
        successStatusCode: HttpStatus.ok,
        successDecoder: CourseModel.fromJson,
      );

  Future<ProfessorModel?> professor({required String uuid}) => _requestHandler(
        request: () => _client.get(ArchiveAPIEndpoints.professor(uuid)),
        successStatusCode: HttpStatus.ok,
        successDecoder: ProfessorModel.fromJson,
      );

  Future<ReferenceModel?> reference({required String uuid}) => _requestHandler(
        request: () => _client.get(ArchiveAPIEndpoints.reference(uuid)),
        successStatusCode: HttpStatus.ok,
        successDecoder: ReferenceModel.fromJson,
      );
}
