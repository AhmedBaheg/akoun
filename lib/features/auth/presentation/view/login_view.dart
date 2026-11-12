import 'package:akoun/core/common_widgets/app_3d_button.dart';
import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:akoun/core/utils/app_localization.dart';
import 'package:akoun/core/utils/validation.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_dashed_divider.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_text_form_field.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/app_background_image.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/auth_container.dart';
import 'widgets/parents_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String name = '';
    String email = '';
    String phone = '';

    return Scaffold(
      body: AppBackgroundImage(
        image: AppStrings.loginBg,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  AuthTextHeader(),
                  SizedBox(height: 48.h),
                  AuthContainer(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 11.w),
                            child: Text(
                              AppLocalization.loginHeroNameTitle,
                              style: AppTextStyles.authFieldLabel,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          AuthTextFormField(
                            validator: (value) => Validation.validateName(value!),
                            borderRadius: 48.r,
                            suffixIcon: AppStrings.nameIcon,
                            hint: AppLocalization.loginHeroNameHint,
                          ),
                          SizedBox(height: 23.h),
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
                  ),
                  SizedBox(height: 40.h),
                  App3DButton(
                    title: AppLocalization.loginStartButton,
                    icon: AppStrings.authIcon,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
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

