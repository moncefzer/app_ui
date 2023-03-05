import 'package:app_ui/core/resources/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

List<String> texts = [
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
  lorem(paragraphs: 1, words: 1),
];

class ShrinkTopListPage extends StatefulWidget {
  const ShrinkTopListPage({super.key});

  @override
  State<ShrinkTopListPage> createState() => _ShrinkTopListPageState();
}

class _ShrinkTopListPageState extends State<ShrinkTopListPage> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  final itemSize = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shrink Top Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final itemPositionOffset = index * (itemSize + 8);
                  final differance =
                      scrollController.offset - itemPositionOffset;

                  final percent = 1 - (differance / (itemSize + 8));
                  double opactity = percent;
                  if (opactity > 1.0) opactity = 1.0;
                  if (opactity < 0.0) opactity = 0.0;
                  double scale = percent;
                  if (scale > 1.0) scale = 1.0;
                  return Align(
                    heightFactor: 1,
                    child: Opacity(
                      opacity: opactity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          color: Colors.redAccent,
                          child: SizedBox(
                            height: itemSize,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      texts[index],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 23),
                                    ),
                                  ),
                                ),
                                Image.network(
                                  AppConstant.avatarImg,
                                  width: 130,
                                  fit: BoxFit.cover,
                                  height: 150,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: texts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
