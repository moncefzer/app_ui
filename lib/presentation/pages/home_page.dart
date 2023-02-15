import 'package:app_ui/core/helper/extensions/context_extensions.dart';
import 'package:app_ui/core/resources/app_colors.dart';
import 'package:app_ui/core/resources/app_constant.dart';
import 'package:flutter/material.dart';

import '../../data/models/movie.dart';
import '../widgets/widgets.dart';
import 'movie_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Movie> movies = Movie.movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _builAppBar(context),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.defaultPadding * 1.5, vertical: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: context.headline3,
                  children: const [
                    TextSpan(
                      text: 'Feaured ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'Movies'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              for (Movie movie in movies)
                InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      MoviePage(
                        movie: movie,
                      ),
                    );
                  },
                  child: MovieListItem(
                    imageUrl: movie.imagePath,
                    name: movie.name,
                    information: formatInfo(movie),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _builAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipPath(
        clipper: _CustomClipper(),
        child: Container(
          width: double.infinity,
          height: 150,
          color: const Color(0xff000B49),
          alignment: Alignment.center,
          child: Text(
            'Explore',
            style: context.headline3.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  String formatInfo(Movie movie) {
    return '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m';
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();

    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
