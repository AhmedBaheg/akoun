import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_container.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_dashed_divider.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_language_section.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_teacher_type_section.dart';
import 'package:akoun/features/auth/presentation/view/widgets/language_selection_widget.dart';
import 'package:akoun/features/auth/presentation/view/widgets/parents_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/app_3d_button.dart';
import '../../../../core/common_widgets/app_background_image.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_localization.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/auth_text_header.dart';
import 'widgets/register_child_details_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundImage(
        image: AppStrings.registerBg,
        alignment: Alignment.topRight,
        imageScale: 1.85,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                AuthTextHeader(),
                SizedBox(height: 48.h),
                AuthContainer(
                  child: Column(
                    children: [
                      RegisterChildDetailsForm(),
                      SizedBox(height: 40.h),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          AuthDashedDivider(
                            color: AppColors.borders,
                            dashWidth: 3,
                            dashSpace: 4,
                            thickness: 2,
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalization.registerWaveDataTitle,
                                style: AppTextStyles.waveData,
                              ),
                              SizedBox(width: 8.w),
                              Image.asset(AppStrings.waveDataIcon),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 26.h),
                      Text(
                        AppLocalization.registerWaveDataSubtitle,
                        style: AppTextStyles.subWaveData,
                      ),
                      SizedBox(height: 16.h),
                      AuthTeacherTypeSection(),
                      SizedBox(height: 23.h),
                      LanguageSelectionWidget(),
                      SizedBox(height: 23.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalization.registerDialectTitle,
                          style: AppTextStyles.selectLanguageTitle,
                        ),
                      ),
                      SizedBox(height: 23.h),
                      AuthLanguageSection(),
                      SizedBox(height: 25.h),
                      AuthDashedDivider(
                        color: AppColors.borders,
                        dashWidth: 4,
                        dashSpace: 8,
                        thickness: 3,
                      ),
                      SizedBox(height: 25.h),
                      ParentsSection(),

                    ],
                  ),
                ),

                SizedBox(height: 40.h),
                App3DButton(
                  title: AppLocalization.loginStartButton,
                  icon: AppStrings.authIcon,
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                    //   formKey.currentState!.save();
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
