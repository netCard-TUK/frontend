import 'package:flutter/cupertino.dart';

class NoneCard extends StatelessWidget {
  const NoneCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('asset/logo.png'),
          const SizedBox(height: 40),
          const Text(
            '검색해서 명함을 찾아보세요',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
