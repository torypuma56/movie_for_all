import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/cast_entity.dart';

class CastCardWidget extends StatelessWidget {
  final CastEntity cast;

  const CastCardWidget({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    final baseUrl =
        dotenv.env['TMDB_IMG_URL_W500'] ?? dotenv.env['TMDB_IMG_URL'] ?? '';
    final profilePath = cast.profilePath?.trim();
    final imageUrl = profilePath == null || profilePath.isEmpty
        ? null
        : profilePath.startsWith('http')
            ? profilePath
            : '$baseUrl$profilePath';
    final character = cast.character.trim().isEmpty ? 'Elenco' : cast.character;

    return SizedBox(
      width: AppSpacing.spaceXl * 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Container(
              width: AppSpacing.spaceXl * 3,
              height: AppSpacing.spaceXl * 3,
              color: AppColors.surfaceContainerLow,
              child: imageUrl == null
                  ? const Icon(Icons.person_outline, color: AppColors.textSubtle)
                  : Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person_outline,
                        color: AppColors.textSubtle,
                      ),
                    ),
            ),
          ),
          AppSpacing.verticalSm,
          Text(
            cast.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTypography.labelMd.copyWith(color: AppColors.textPrimary),
          ),
          AppSpacing.verticalXs,
          Text(
            character,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTypography.bodySm,
          ),
        ],
      ),
    );
  }
}
