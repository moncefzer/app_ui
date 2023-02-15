import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:video_player/video_player.dart';

import 'package:app_ui/core/helper/extensions/context_extensions.dart';
import 'package:app_ui/core/resources/app_constant.dart';

import '../../data/models/movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackground(context, movie),
          _buildMovieInfo(context),
          _builActions(context),
        ],
      ),
    );
  }

  Positioned _builActions(BuildContext context) {
    return Positioned(
      bottom: 50,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: const Color(0xffff7272),
                fixedSize: Size(context.width * 0.425, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {},
              child: const Text('Add to WatchList'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                fixedSize: Size(context.width * 0.425, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                navigateTo(context, _MoviePlayer(movie: movie));
              },
              child: const Text('Start watching'),
            )
          ],
        ),
      ),
    );
  }

  Positioned _buildMovieInfo(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.name,
              style: context.headline2.copyWith(color: Colors.white),
            ),
            Text(
              formatInfo(movie),
              style: context.headline6.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            RatingBar.builder(
              initialRating: 3.5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 20,
              unratedColor: Colors.white,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(height: 10),
            Text(
              'Lorem ibsum lerem Lorem ibsum lerem Lorem ibsum le im lerem Lorem ibsum lerem Lorem ibsum lerem Lorem ibsum lerem Lorem ibsum lerem ',
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              style: context.headline5.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  String formatInfo(Movie movie) {
    return '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m';
  }

  List<Widget> _buildBackground(context, Movie movie) {
    return [
      Container(
        height: double.infinity,
        color: const Color(0xff000B49),
      ),
      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Color(0xff000B49),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.5],
            ),
          ),
        ),
      )
    ];
  }
}

class _MoviePlayer extends StatefulWidget {
  _MoviePlayer({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<_MoviePlayer> createState() => __MoviePlayerState();
}

class __MoviePlayerState extends State<_MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath)
      ..initialize().then((_) => {setState(() {})});

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController, aspectRatio: 16 / 9);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
