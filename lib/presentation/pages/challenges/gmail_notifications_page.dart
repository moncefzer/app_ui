import 'package:app_ui/core/helper/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class GmailNotificationsPage extends StatefulWidget {
  const GmailNotificationsPage({super.key});

  @override
  State<GmailNotificationsPage> createState() => _GmailNotificationsPageState();
}

class _GmailNotificationsPageState extends State<GmailNotificationsPage> {
  bool expanded = false;
  final scrollController = ScrollController();

  void _onScrollDirecrion() {
    //! access [scrollController.positions.last] instead [scrollController.position]
    /// the last is used only if there is just one scrollable child
    /// solution link [https://stackoverflow.com/questions/53824944/flutter-exception-scrollcontroller-attached-to-multiple-scroll-views/70672454#70672454]
    if (scrollController.positions.last.userScrollDirection ==
            ScrollDirection.reverse &&
        expanded) {
      setState(() {
        expanded = false;
      });
    } else if (scrollController.positions.last.userScrollDirection ==
            ScrollDirection.forward &&
        !expanded) {
      setState(() {
        expanded = true;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _GmailFAB(
        expanded: expanded,
        onTap: () {},
      ),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (details) {
            _onScrollDirecrion();
            return true;
          },
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                iconTheme: IconThemeData(color: Colors.black),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Row(
                      children: const [
                        SizedBox(width: 7),
                        Icon(Icons.search),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(13.0),
                            child: Text('Search Conversations'),
                          ),
                        ),
                        Icon(Icons.more_vert_outlined),
                        SizedBox(width: 7),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const _NotificationItem();
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
      title: const Text('515'),
      subtitle: Text(lorem(paragraphs: 1, words: 4)),
      trailing: const Text('30 min'),
    );
  }
}

class _GmailFAB extends StatefulWidget {
  const _GmailFAB({
    this.expanded = false,
    required this.onTap,
  });

  final bool expanded;
  final VoidCallback onTap;
  @override
  @override
  State<_GmailFAB> createState() => _GmailFABState();
}

class _GmailFABState extends State<_GmailFAB> {
  final _minSize = 50.0;

  double _maxSize = 145.0;

  final _iconSize = 24.0;
  final _keyText = GlobalKey();

  // final void Function(bool value) onChanged;

  void initState() {
    //! wait after the first frame is rendered  [there is package flutter layout]
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _maxSize = (_keyText.currentContext?.size?.width as double) +
            _minSize +
            _iconSize / 2;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final position = _minSize / 2 - _iconSize / 2;
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: Colors.blue[800],
          borderRadius: BorderRadius.circular(_maxSize),
        ),
        width: widget.expanded ? _maxSize : _minSize,
        height: _minSize,
        duration: const Duration(milliseconds: 250),
        child: Stack(
          children: [
            Positioned(
              top: position,
              left: position,
              child: const Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: position,
              left: position + 1.5 * _iconSize,
              child: Text(
                'Start Chat With my Friends',
                key: _keyText,
                style: context.headline4
                    .copyWith(color: Colors.white, height: 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
