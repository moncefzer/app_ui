import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(150, 50),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text('this is page three'),
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) {
              //       return PageThree();
              //     },
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }
}
