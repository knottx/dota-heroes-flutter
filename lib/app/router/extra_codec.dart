import 'dart:convert';

import 'package:dota_heroes/app/utils/logger.dart';
import 'package:dota_heroes/app/router/extra_data.dart';

class ExtraCodec extends Codec<ExtraData?, String?> {
  const ExtraCodec();

  @override
  Converter<String?, ExtraData?> get decoder {
    return const ExtraDecoder();
  }

  @override
  Converter<ExtraData?, String?> get encoder {
    return const ExtraEncoder();
  }
}

class ExtraDecoder extends Converter<String?, ExtraData?> {
  const ExtraDecoder();

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

class ExtraEncoder extends Converter<ExtraData?, String?> {
  const ExtraEncoder();
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
