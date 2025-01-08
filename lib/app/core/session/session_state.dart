import 'package:equatable/equatable.dart';

class SessionState extends Equatable {
  final Set<int> favoriteIds;

  const SessionState({
    this.favoriteIds = const {},
  });

  @override
  List<Object?> get props => [
        favoriteIds,
      ];

  SessionState copyWith({
    Set<int>? favoriteIds,
  }) {
    return SessionState(
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }
}
