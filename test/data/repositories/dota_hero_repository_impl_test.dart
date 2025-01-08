import 'package:dota_heroes/data/data_source/dota_hero_remote_data_source.dart';
import 'package:dota_heroes/data/repositories/dota_hero_repository_impl.dart';
import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/entities/dota_hero_attribute.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dota_hero_repository_impl_test.mocks.dart';

@GenerateMocks([DotaHeroRemoteDataSource])
void main() {
  late MockDotaHeroRemoteDataSource mockRemoteDataSource;
  late DotaHeroRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockDotaHeroRemoteDataSource();
    repository = DotaHeroRepositoryImpl(mockRemoteDataSource);
  });

  group('getHeroStats', () {
    final tHeroModels = [
      DotaHero(
        id: 1,
        name: 'npc_dota_hero_axe',
        localizedName: 'Axe',
        primaryAttr: DotaHeroAttribute.strength,
        baseHealth: 200,
      ),
      DotaHero(
        id: 2,
        name: 'npc_dota_hero_bane',
        localizedName: 'Bane',
        primaryAttr: DotaHeroAttribute.intelligence,
        baseHealth: 180,
      ),
    ];

    test(
        'should return a list of DotaHero when the call to remote data source is successful',
        () async {
      when(mockRemoteDataSource.getHeroStats())
          .thenAnswer((_) async => tHeroModels);

      final result = await repository.getHeroStats();

      expect(result, isA<List<DotaHero>>());
      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[1].name, 'npc_dota_hero_bane');
    });

    test(
        'should return an empty list when the remote data source returns an empty list',
        () async {
      when(mockRemoteDataSource.getHeroStats()).thenAnswer((_) async => []);

      final result = await repository.getHeroStats();

      expect(result, isEmpty);
    });
  });
}
