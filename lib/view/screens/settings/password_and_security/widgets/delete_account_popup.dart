import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings.dart/app_strings.dart';
import '../../../../components/common_bottom_shit/common_bottom_sheet.dart';
import '../../../../components/snackbar_helper/snackbar_helper.dart';

class DeleteAccountPopup extends StatelessWidget {
  const DeleteAccountPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.4,
      // Now using contentBuilder
      contentBuilder: (context, scrollController) {
        final textTheme = Theme.of(context).textTheme;
        return Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.deleteProfilePopupTitle,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.deleteProfiledata1,
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    AppStrings.deleteProfiledata2,
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    AppStrings.deleteProfiledata3,
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    AppStrings.deleteProfiledata4,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    SnackbarHelper.show(message: AppStrings.deleteSuccessfully);
                  },

                  child: const Text(
                    AppStrings.yesConfirm,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    SnackbarHelper.show(message: AppStrings.deleteCancel);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                  ),

                  child: const Text(
                    AppStrings.cancel,
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
