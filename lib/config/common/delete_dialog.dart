import 'package:flutter/material.dart';

import '../theme/theme.dart';

class DeleteDialog {
  late Function(void Function()) _notifier;
  bool _isLoading = false;

  void setLoading(bool status) {
    _notifier(() => _isLoading = status);
  }

  Future<void> show({
    required BuildContext context,
    String txtCancelButton = "Cancel",
    String txtConfirmButton = "Confirm",
    required Function() onTapConfirm,
    Function()? onTapCancel,
  }) {
    final size = MediaQuery.of(context).size;

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            if (_isLoading) return false;
            if (onTapCancel != null) {
              await onTapCancel();
            }
            return false;
          },
          child: Dialog(
            child: Container(
              width: size.width * 0.5,
              padding: const EdgeInsets.fromLTRB(
                AppPadding.p16,
                AppPadding.p10,
                AppPadding.p16,
                AppPadding.p16,
              ),
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Delete TODO ?",
                      style: Typograph.textXlMedium,
                    ),
                    const SizedBox(height: AppSize.s16),
                    StatefulBuilder(
                      builder: (context, setState) {
                        _notifier = setState;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.blue,
                              ),
                              child: Text(txtCancelButton),
                            ),
                            const SizedBox(width: AppSize.s16),
                            ElevatedButton(
                              onPressed: onTapConfirm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.alert,
                              ),
                              child: Text(txtConfirmButton),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
