import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.title,
    required this.description,
    required this.onDetail,
    required this.onDelete,
    super.key,
  });

  final String title;
  final String description;
  final Function() onDelete;
  final Function() onDetail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDetail,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: Typograph.textMdMedium
                          .copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: AppSize.s4),
                  Flexible(
                    child: Text(
                      description,
                      style: Typograph.textMdMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onDelete,
              child: const Icon(
                Icons.close,
                color: AppColor.alert,
                size: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
