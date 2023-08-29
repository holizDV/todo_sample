import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

@RoutePage()
class Test3Page extends StatefulWidget {
  const Test3Page({super.key});

  @override
  State<Test3Page> createState() => _Test3PageState();
}

class _Test3PageState extends State<Test3Page> {
  final inputCtrl = TextEditingController();
  List<String> dictionaries = [
    "pro",
    "gram",
    "merit",
    "program",
    "it",
    "programmer"
  ];
  String result = "";

  void _onProcess() {
    if (inputCtrl.text.isEmpty) {
      return;
    }
    final rs = _findAllWordBreaks(inputCtrl.text, dictionaries);
    setState(() {
      result = rs.toString();
    });
  }

  List<String> _findAllWordBreaks(String input, List<String> dictionary) {
    List<String> results = [];
    _wordBreakHelper(input, dictionary, "", results);
    return results;
  }

  void _wordBreakHelper(
    String remaining,
    List<String> dictionary,
    String current,
    List<String> results,
  ) {
    if (remaining.isEmpty) {
      results.add(current);
      return;
    }

    for (String word in dictionary) {
      if (remaining.startsWith(word)) {
        _wordBreakHelper(remaining.substring(word.length), dictionary,
            "$current $word", results);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logic Test 3"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p24),
        child: Column(
          children: [
            TextFormField(
              controller: inputCtrl,
              maxLines: 1,
              keyboardType: TextInputType.text,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: const InputDecoration(
                hintText: "Input",
                hintStyle: TextStyle(color: AppColor.grey),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSize.s24),
            ElevatedButton(
              onPressed: _onProcess,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
              child: const Text("Process"),
            ),
            const SizedBox(height: AppSize.s28),
            Text(
              result,
              style: Typograph.textXlMedium,
            ),
          ],
        ),
      ),
    );
  }
}
