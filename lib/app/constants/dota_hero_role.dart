import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum DotaHeroRole {
  @JsonValue('Carry')
  carry,
  @JsonValue('Support')
  support,
  @JsonValue('Nuker')
  nuker,
  @JsonValue('Disabler')
  disabler,
  @JsonValue('Jungler')
  jungler,
  @JsonValue('Durable')
  durable,
  @JsonValue('Escape')
  escape,
  @JsonValue('Pusher')
  pusher,
  @JsonValue('Initiator')
  initiator,
  ;

  String title(BuildContext context) {
    switch (this) {
      case DotaHeroRole.carry:
        return AppLocalizations.of(context).roleCarry;
      case DotaHeroRole.support:
        return AppLocalizations.of(context).roleSupport;
      case DotaHeroRole.nuker:
        return AppLocalizations.of(context).roleNuker;
      case DotaHeroRole.disabler:
        return AppLocalizations.of(context).roleDisabler;
      case DotaHeroRole.jungler:
        return AppLocalizations.of(context).roleJungler;
      case DotaHeroRole.durable:
        return AppLocalizations.of(context).roleDurable;
      case DotaHeroRole.escape:
        return AppLocalizations.of(context).roleEscape;
      case DotaHeroRole.pusher:
        return AppLocalizations.of(context).rolePusher;
      case DotaHeroRole.initiator:
        return AppLocalizations.of(context).roleInitiator;
    }
  }
}
