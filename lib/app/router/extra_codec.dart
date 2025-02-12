import 'dart:convert';

import 'package:dota_heroes/app/router/extra_data.dart';
import 'package:dota_heroes/common/logger.dart';

class ExtraCodec extends Codec<ExtraData?, String?> {
  const ExtraCodec();

  @override
  Converter<String?, ExtraData?> get decoder {
    return const _ExtraDecoder();
  }

  @override
  Converter<ExtraData?, String?> get encoder {
    return const _ExtraEncoder();
  }
}

class _ExtraDecoder extends Converter<String?, ExtraData?> {
  const _ExtraDecoder();

  @override
  ExtraData? convert(String? input) {
    if (input == null) return null;
    try {
      return ExtraData.fromJson(jsonDecode(input));
    } catch (error) {
      Logger.logError(error);
      throw FormatException('Unable to parse input: $input');
    }
  }
}

class _ExtraEncoder extends Converter<ExtraData?, String?> {
  const _ExtraEncoder();

  @override
  String? convert(ExtraData? input) {
    if (input == null) return null;
    try {
      return jsonEncode(input.toJson());
    } catch (error) {
      Logger.logError(error);
      throw FormatException('Cannot encode type ${input.runtimeType}');
    }
  }
}
