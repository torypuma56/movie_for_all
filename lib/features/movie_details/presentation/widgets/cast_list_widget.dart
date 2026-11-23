import 'package:flutter/material.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';
import 'package:movies_4_all/features/movie_details/presentation/widgets/cast_card_widget.dart';

class CastListWidget extends StatelessWidget {
  final List<CastEntity> cast;

  const CastListWidget({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    if (cast.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Elenco',
          style: AppTypography.headlineMd,
        ),
        AppSpacing.verticalSm,
        SizedBox(
          height: AppSpacing.spaceXl * 5,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            separatorBuilder: (context, index) => AppSpacing.horizontalSm,
            itemBuilder: (context, index) => CastCardWidget(cast: cast[index]),
          ),
        ),
      ],
    );
  }
}
