import 'package:equatable/equatable.dart';

class SessionState extends Equatable {
  final List<int> favoriteIds;

  const SessionState({
    this.favoriteIds = const [],
  });

  @override
  List<Object?> get props => [
        favoriteIds,
      ];

  SessionState copyWith({
    List<int>? favoriteIds,
  }) {
    return SessionState(
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }
}
