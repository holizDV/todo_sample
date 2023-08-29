import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

@RoutePage()
class Test2Page extends StatefulWidget {
  const Test2Page({super.key});

  @override
  State<Test2Page> createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  final inputCtrl = TextEditingController();
  List<int> numbers = [2, 7, 11, 15];
  String result = "";

  void _onProcess() {
    if (inputCtrl.text.isEmpty) {
      return;
    }
    Map<int, int> numToIndex = {};

    for (int i = 0; i < numbers.length; i++) {
      int complement = int.parse(inputCtrl.text) - numbers[i];

      numToIndex[numbers[i]] = i;
      if (numToIndex.containsKey(complement)) {
        int index = numToIndex[complement]!;
        setState(() {
          result = "[$index, $i]";
        });
        return;
      }
      if (!numToIndex.containsKey(complement)) {
        setState(() {
          result = "<no way>";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logic Test 2"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppPadding.p24),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Text(
            //       "Data : ",
            //       style: Typograph.textXlMedium,
            //     ),
            //     Text(
            //       numbers.toString(),
            //       style: Typograph.textXlMedium,
            //     )
            //   ],
            // ),
            // const SizedBox(height: AppSize.s16),
            // TextFormField(
            //   controller: inputCtrl,
            //   maxLines: 1,
            //   keyboardType: TextInputType.number,
            //   onTapOutside: (event) {
            //     FocusScope.of(context).unfocus();
            //   },
            //   decoration: const InputDecoration(
            //     hintText: "Input",
            //     hintStyle: TextStyle(color: AppColor.grey),
            //     enabledBorder: OutlineInputBorder(),
            //     focusedBorder: OutlineInputBorder(),
            //   ),
            // ),
            // const SizedBox(height: AppSize.s24),
            // ElevatedButton(
            //   onPressed: _onProcess,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: AppColor.primary,
            //   ),
            //   child: const Text("Process"),
            // ),
            // const SizedBox(height: AppSize.s28),
            // Text(
            //   result,
            //   style: Typograph.textXlMedium,
            // ),
          ],
        ),
      ),
    );
  }
}
