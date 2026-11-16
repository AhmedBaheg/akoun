import 'dart:developer';

import 'package:akoun/core/router/app_router.dart';
import 'package:akoun/core/services/api_service.dart';
import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/features/auth/data/data_source/remote/api_auth_remote_data_source_impl.dart';
import 'package:akoun/features/auth/data/repo/auth_repo_impl.dart';
import 'package:akoun/features/auth/domain/entity/user_entity.dart';
import 'package:akoun/features/auth/domain/use_case/register_use_case.dart';
import 'package:akoun/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_container.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_dashed_divider.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_language_section.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_teacher_type_section.dart';
import 'package:akoun/features/auth/presentation/view/widgets/language_selection_widget.dart';
import 'package:akoun/features/auth/presentation/view/widgets/parents_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/app_3d_button.dart';
import '../../../../core/common_widgets/app_background_image.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/l10n_extension.dart';
import 'widgets/auth_text_header.dart';
import 'widgets/register_child_details_form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _teacherType = '';
  String _childName = '';
  String _age = '';
  String _gender = '';
  String _dialect = '';
  String _email = '';
  String _phone = '';
  String _password = '';
  String _language = 'ar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(
          registerUseCase: RegisterUseCase(
            authRepo: AuthRepoImpl(
              apiAuthRemoteDataSource: ApiAuthRemoteDataSourceImpl(
                apiService: ApiService(),
              ),
            ),
          ),
        ),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            log('👁️ [RegisterView.BlocListener] State: ${state.runtimeType}');

            if (state is AuthRegisterSuccess) {
              log('🚀 [RegisterView.BlocListener] Success! Navigating to IntroView with teacherType: $_teacherType');
              context.go(AppRouter.introView, extra: _teacherType);
            } else if (state is AuthFailure) {
              log('🚨 [RegisterView.BlocListener] Failure! Message: ${state.errorMessage}');
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? ''),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is AuthLoading) {
              log('⏳ [RegisterView.BlocListener] AuthLoading...');
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Loading...'),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
          child: AppBackgroundImage(
            image: AppStrings.registerBg,
            alignment: Alignment.topRight,
            imageScale: 1.85,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const AuthTextHeader(),
                    SizedBox(height: 48.h),
                    AuthContainer(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            RegisterChildDetailsForm(
                              onNameSaved: (value) => _childName = value ?? '',
                              onAgeSaved: (value) => _age = value ?? '',
                              onGenderChanged: (value) => _gender = value.name,
                            ),

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
                                      context.l10n.registerWaveDataTitle,
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
                              context.l10n.registerWaveDataSubtitle,
                              style: AppTextStyles.subWaveData,
                            ),

                            SizedBox(height: 16.h),
                            AuthTeacherTypeSection(
                              onChanged: (value) {
                                _teacherType = value.name;
                              },
                            ),

                            SizedBox(height: 23.h),
                            LanguageSelectionWidget(
                              onChanged: (value) {
                                _language = value;
                              },
                            ),

                            SizedBox(height: 23.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                context.l10n.registerDialectTitle,
                                style: AppTextStyles.selectLanguageTitle,
                              ),
                            ),

                            SizedBox(height: 23.h),
                            AuthLanguageSection(
                              onChanged: (value) {
                                _dialect = value.name;
                              },
                            ),

                            SizedBox(height: 25.h),
                            AuthDashedDivider(
                              color: AppColors.borders,
                              dashWidth: 4,
                              dashSpace: 8,
                              thickness: 3,
                            ),
                            SizedBox(height: 25.h),
                            ParentsSection(
                              borderRadius: 16,
                              onEmailSaved: (value) => _email = value ?? '',
                              onPhoneSaved: (value) => _phone = value ?? '',
                              onPasswordSaved: (value) => _password = value ?? '',
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),
                    Builder(
                      builder: (context) {
                        return App3DButton(
                          title: context.l10n.loginStartButton,
                          icon: AppStrings.authIcon,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              log('🔘 [RegisterView.onPressed] Submitting register:');
                              log('   childName: $_childName, age: $_age, gender: $_gender');
                              log('   teacherType: $_teacherType, dialect: $_dialect, language: $_language');

                              context.read<AuthCubit>().register(
                                    entity: UserEntity(
                                      email: _email,
                                      phone: _phone,
                                      password: _password,
                                      language: _language,
                                      childName: _childName,
                                      age: _age,
                                      gender: _gender,
                                      mentorGender: _teacherType,
                                      dialectMentorUrl: _dialect,
                                    ),
                                  );
                            } else {
                              log('⚠️ [RegisterView.onPressed] Validation failed!');
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
