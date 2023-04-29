import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CurlLogger {
  CurlLogger._();

  static void log(RequestOptions requestOptions) {
    if (kDebugMode) {
      try {
        dev.log(
          _cURLRepresentation(requestOptions),
          name: 'CURL',
        );
      } catch (err) {
        dev.log(
          'unable to create a CURL representation of the requestOptions',
          name: 'CURL',
        );
      }
    }
  }

  static String _cURLRepresentation(RequestOptions options) {
    List<String> components = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H \'$k: $v\'');
      }
    });

    final optionsData = options.data;
    if (optionsData != null) {
      if (optionsData is FormData) {
        final fields = optionsData.fields;
        fields.forEach((e) {
          components.add('-F \'${e.key}="${e.value}"\'');
        });

        final files = optionsData.files;
        files.forEach((e) {
          components.add('-F \'${e.key}=@"${e.value.filename}"\'');
        });
      } else {
        final data = json.encode(optionsData);
        components.add('-d \'$data\'');
      }
    }

    components.add('\'${options.uri.toString()}\'');

    return components.join(' \\\n\t');
  }
}
