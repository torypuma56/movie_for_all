import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/genre_entity.dart';
import 'package:movies_4_all/features/movie_details/presentation/widgets/genere_card_widget.dart';
import 'package:sizer/sizer.dart';

class HeadImageMovie extends StatelessWidget {
  final String imagePath;
  final List<GenreEntity> genres;
  final String title;
  const HeadImageMovie({
    super.key,
    required this.imagePath,
    required this.genres,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final imgW500 = dotenv.env['TMDB_IMG_URL_W500'] ?? '';
    final imgOriginal = dotenv.env['TMDB_IMG_URL'] ?? imgW500;
    final genresString = genres.map((e) => e.name).toList();
    final imageUrl = imagePath.startsWith('http')
        ? imagePath
        : '$imgOriginal$imagePath';

    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.xl,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: AppSpacing.paddingMd,
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.xl,
                gradient: AppGradients.posterBottomScrim,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (genresString.isNotEmpty)
                    SizedBox(
                      height: 4.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final genreName = genresString[index];
                          return GenreCardWidget(genreName: genreName);
                        },
                        separatorBuilder: (context, index) =>
                            AppSpacing.horizontalSm,
                        itemCount: genresString.length,
                      ),
                    ),
                  AppSpacing.verticalSm,
                  Text(
                    title,
                    style: AppTypography.titleLg.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
