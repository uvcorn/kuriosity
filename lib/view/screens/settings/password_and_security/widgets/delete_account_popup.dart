import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/common_bottom_shit/common_bottom_sheet.dart';
import '../../../../components/snackbar_helper/snackbar_helper.dart';

class DeleteAccountPopup extends StatelessWidget {
  const DeleteAccountPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CommonBottomSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.4,
      contentBuilder: (context, scrollController) {
        final textTheme = Theme.of(context).textTheme;
        return Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.08,
            right: size.width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.deleteProfilePopupTitle,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: size.width * 0.045,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.deleteProfiledata1,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  Text(
                    AppStrings.deleteProfiledata2,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  Text(
                    AppStrings.deleteProfiledata3,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  Text(
                    AppStrings.deleteProfiledata4,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.035),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    SnackbarHelper.show(message: AppStrings.deleteSuccessfully);
                  },
                  child: Text(
                    AppStrings.yesConfirm,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015),
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
                  child: Text(
                    AppStrings.cancel,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: size.width * 0.04,
                    ),
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
