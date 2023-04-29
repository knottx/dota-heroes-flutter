import 'package:dota_heroes/domain/entities/dota_hero.dart';
import 'package:equatable/equatable.dart';

enum DotaHeroDetailScreenStatus {
  initial,
  loading,
  ready,
  failure,
  ;

  bool get isLoading => this == DotaHeroDetailScreenStatus.loading;
}

class DotaHeroDetailScreenState extends Equatable {
  final DotaHeroDetailScreenStatus status;
  final DotaHero? dotaHero;
  final Object? error;

  const DotaHeroDetailScreenState({
    this.status = DotaHeroDetailScreenStatus.initial,
    this.dotaHero,
    this.error,
  });

  @override
  List<Object?> get props => [
        status,
        dotaHero,
        error,
      ];

  DotaHeroDetailScreenState copyWith({
    DotaHeroDetailScreenStatus? status,
    DotaHero? dotaHero,
    Object? error,
  }) {
    return DotaHeroDetailScreenState(
      status: status ?? this.status,
      dotaHero: dotaHero ?? this.dotaHero,
      error: error ?? this.error,
    );
  }

  DotaHeroDetailScreenState loading() {
    return copyWith(
      status: DotaHeroDetailScreenStatus.loading,
    );
  }

  DotaHeroDetailScreenState ready() {
    return copyWith(
      status: DotaHeroDetailScreenStatus.ready,
    );
  }

  DotaHeroDetailScreenState failure(
    Object error,
  ) {
    return copyWith(
      status: DotaHeroDetailScreenStatus.failure,
      error: error,
    );
  }
}
