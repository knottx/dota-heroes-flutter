import 'package:dio/dio.dart';
import 'package:dota_heroes/app/core/api/api_client.dart';
import 'package:dota_heroes/data/data_source/dota_hero_remote_data_source.dart';
import 'package:dota_heroes/data/models/dota_hero_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dota_hero_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late DotaHeroRemoteDataSource dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = DotaHeroRemoteDataSource(mockApiClient);
  });

  group('getHeroStats', () {
    test('should return a list of DotaHeroModel when successful', () async {
      final response = Response(
        data: [
          {
            'id': 1,
            'name': 'npc_dota_hero_axe',
            'localizedName': 'Axe',
            'primaryAttr': 'strength',
            'baseHealth': 200,
          },
          {
            'id': 2,
            'name': 'npc_dota_hero_bane',
            'localizedName': 'Bane',
            'primaryAttr': 'intelligence',
            'baseHealth': 180,
          },
        ],
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test-path'),
      );
      when(mockApiClient.get('/api/heroStats'))
          .thenAnswer((_) async => response);

      final result = await dataSource.getHeroStats();

      expect(result, isA<List<DotaHeroModel>>());
      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[1].name, 'npc_dota_hero_bane');
    });

    test('should return an empty list when the response data is not a list',
        () async {
      final response = Response(
        data: {},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test-path'),
      );

      when(mockApiClient.get('/api/heroStats'))
          .thenAnswer((_) async => response);

      final result = await dataSource.getHeroStats();

      expect(result, isEmpty);
    });
  });
}
