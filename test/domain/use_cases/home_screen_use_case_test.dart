import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:dota_heroes/domain/repositories/dota_hero_repository.dart';
import 'package:dota_heroes/domain/use_cases/home_screen_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_use_case_test.mocks.dart';

@GenerateMocks([DotaHeroRepository])
void main() {
  late HomeScreenUseCase useCase;
  late MockDotaHeroRepository mockRepository;

  setUp(() {
    mockRepository = MockDotaHeroRepository();
    useCase = HomeScreenUseCase(mockRepository);
  });

  group('HomeScreenUseCase.getHeroStats', () {
    final heroesList = <DotaHero>[
      const DotaHero(id: 1, name: 'Axe'),
      const DotaHero(id: 2, name: 'Crystal Maiden'),
    ];

    test('should return Result.success when repository returns data', () async {
      when(mockRepository.getHeroStats()).thenAnswer((_) async => heroesList);

      final result = await useCase.getHeroStats();

      expect(result.isSuccess(), isTrue);
      expect(result.data, equals(heroesList));
      verify(mockRepository.getHeroStats()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Result.failure when repository throws an error',
        () async {
      final exception = Exception('Error occurred');
      when(mockRepository.getHeroStats()).thenThrow(exception);

      final result = await useCase.getHeroStats();

      expect(result.isFailure(), isTrue);
      expect(result.error, equals(exception));
      verify(mockRepository.getHeroStats()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
