import 'package:dota_heroes/app/data/models/dota_hero_model.dart';
import 'package:equatable/equatable.dart';

enum DotaHeroDetailPageStatus {
  initial,
  loading,
  ready,
  failure,
  ;

  bool get isLoading => this == DotaHeroDetailPageStatus.loading;
}

class DotaHeroDetailPageState extends Equatable {
  final DotaHeroDetailPageStatus status;
  final DotaHero? dotaHero;
  final Object? error;

  const DotaHeroDetailPageState({
    this.status = DotaHeroDetailPageStatus.initial,
    this.dotaHero,
    this.error,
  });

  @override
  List<Object?> get props => [
        status,
        dotaHero,
        error,
      ];

  DotaHeroDetailPageState copyWith({
    DotaHeroDetailPageStatus? status,
    DotaHero? dotaHero,
    Object? error,
  }) {
    return DotaHeroDetailPageState(
      status: status ?? this.status,
      dotaHero: dotaHero ?? this.dotaHero,
      error: error ?? this.error,
    );
  }

  DotaHeroDetailPageState loading() {
    return copyWith(
      status: DotaHeroDetailPageStatus.loading,
    );
  }

  DotaHeroDetailPageState ready() {
    return copyWith(
      status: DotaHeroDetailPageStatus.ready,
    );
  }

  DotaHeroDetailPageState failure(
    Object error,
  ) {
    return copyWith(
      status: DotaHeroDetailPageStatus.failure,
      error: error,
    );
  }
}
