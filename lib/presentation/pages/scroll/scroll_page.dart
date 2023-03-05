import 'package:app_ui/core/resources/app_constant.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            // title: const Text(
            //   'Custom Scroll View',
            //   style: TextStyle(color: Colors.white),
            // ),
            backgroundColor: Colors.teal[600],
            centerTitle: true,
            // pinned: true, //* stay visible in screen
            // floating: true, //* will show when start scroll up
            stretch: true,
            // snap: true,  //* will show appBar one time with animation [with floating]
            expandedHeight: 400,

            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              title: const Text(
                'Custom Scroll View',
                style: TextStyle(color: Colors.white),
              ),
              expandedTitleScale: 1.2,
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withOpacity(0.4),
                      Color.fromARGB(0, 184, 118, 118),
                      Colors.black.withOpacity(0.3),
                    ],
                    stops: [0.1, 0.6, 0.95],
                  ),
                ),
                child: Image.network(
                  AppConstant.backgroundImgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     width: double.infinity,
          //     height: 200,
          //     color: Colors.green,
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // print(index);
                return ListTile(
                  title: Text('Item ${index}'),
                );
              },
              childCount: 40,
            ),
          )
        ],
      ),
    );
  }
}
