import 'package:dota_heroes/app/modules/dota_hero_detail/controllers/dota_hero_detail_controller.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/dota_hero_detail_arguments.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_attribute_section.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_header_section.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_roles_section.dart';
import 'package:dota_heroes/app/modules/dota_hero_detail/widgets/dota_hero_detail_stats_section.dart';
import 'package:dota_heroes/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotaHeroDetailView extends GetView<DotaHeroDetailController> {
  @override
  // ignore: overridden_fields
  final String tag = (Get.arguments as DotaHeroDetailArguments).tag;

  DotaHeroDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageName.dota2Logo,
          height: 32,
        ),
        centerTitle: true,
        actions: [
          _favoriteAppBarButton(),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImageName.background,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: SafeArea(
                child: _body(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _favoriteAppBarButton() {
    return Obx(() {
      final favoriteIds = controller.favoriteIds;
      final dotaHero = controller.arguments.dotaHero;
      final isFavorite = favoriteIds.contains(dotaHero.id);
      return IconButton(
        onPressed: controller.onTapFavorite,
        icon: Icon(
          isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          size: 24,
        ),
      );
    });
  }

  Widget _body() {
    final dotaHero = controller.arguments.dotaHero;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DotaHeroDetailHeaderSection(dotaHero: dotaHero),
        DotaHeroDetailAttributeSection(dotaHero: dotaHero),
        const Divider(
          thickness: 0.5,
          height: 0.5,
          color: Colors.grey,
        ),
        DotaHeroDetailRolesSection(dotaHero: dotaHero),
        const Divider(
          thickness: 0.5,
          height: 0.5,
          color: Colors.grey,
        ),
        DotaHeroDetailStatsSection(dotaHero: dotaHero),
        const SizedBox(height: 16),
      ],
    );
  }
}
