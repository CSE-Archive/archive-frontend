import 'dart:io';

import 'package:cse_archive/app/constants/api_endpoints.dart';
import 'package:cse_archive/app/models/recorded_classroom.dart';
import 'package:cse_archive/app/models/reference.dart';
import 'package:cse_archive/app/models/resource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

Future<T?> _tryCatchWrapper<T>(Future<T?> Function() request) async {
  try {
    return await request();
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
  }

  return null;
}

class APIService extends GetxService {
  static APIService get to => Get.find();

  final _client = Dio(
    BaseOptions(
      validateStatus: (_) => true,
    ),
  );

  Future<
      ({
        List<ResourceModel> resources,
        List<RecordedClassroomModel> recordings,
        List<ReferenceModel> references,
      })?> home() => _tryCatchWrapper(
        () async {
          final response = await _client.get(ArchiveAPIEndpoints.home);

          if (response.statusCode == HttpStatus.ok) {
            return (
              resources: ResourceModel.listFromJson(
                response.data['resources']['results'],
              ),
              recordings: RecordedClassroomModel.listFromJson(
                response.data['recordings']['results'],
              ),
              references: ReferenceModel.listFromJson(
                response.data['references']['results'],
              ),
            );
          }

          return null;
        },
      );
}
