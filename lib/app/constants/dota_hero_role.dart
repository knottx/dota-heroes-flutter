enum DotaHeroRole {
  carry,
  support,
  nuker,
  disabler,
  jungler,
  durable,
  escape,
  pusher,
  initiator,
}

extension DotaHeroRoleExtension on DotaHeroRole {
  String get keyValue {
    switch (this) {
      case DotaHeroRole.carry:
        return 'Carry';
      case DotaHeroRole.support:
        return 'Support';
      case DotaHeroRole.nuker:
        return 'Nuker';
      case DotaHeroRole.disabler:
        return 'Disabler';
      case DotaHeroRole.jungler:
        return 'Jungler';
      case DotaHeroRole.durable:
        return 'Durable';
      case DotaHeroRole.escape:
        return 'Escape';
      case DotaHeroRole.pusher:
        return 'Pusher';
      case DotaHeroRole.initiator:
        return 'Initiator';
    }
  }

  String get title {
    switch (this) {
      case DotaHeroRole.carry:
        return 'Carry';
      case DotaHeroRole.support:
        return 'Support';
      case DotaHeroRole.nuker:
        return 'Nuker';
      case DotaHeroRole.disabler:
        return 'Disabler';
      case DotaHeroRole.jungler:
        return 'Jungler';
      case DotaHeroRole.durable:
        return 'Durable';
      case DotaHeroRole.escape:
        return 'Escape';
      case DotaHeroRole.pusher:
        return 'Pusher';
      case DotaHeroRole.initiator:
        return 'Initiator';
    }
  }
}
