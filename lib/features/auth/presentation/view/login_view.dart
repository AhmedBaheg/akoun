import 'package:akoun/core/common_widgets/app_3d_button.dart';
import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:akoun/core/utils/l10n_extension.dart';
import 'package:akoun/core/utils/validation.dart';
import 'package:akoun/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_dashed_divider.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_text_form_field.dart';
import 'package:akoun/features/auth/presentation/view/widgets/auth_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/app_background_image.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/data_source/remote/api_auth_remote_data_source_impl.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/login_use_case.dart';
import 'widgets/auth_container.dart';
import 'widgets/parents_section.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(
          loginUseCase: LoginUseCase(
            authRepo: AuthRepoImpl(
              apiAuthRemoteDataSource: ApiAuthRemoteDataSourceImpl(
                apiService: ApiService(),
              ),
            ),
          ),
        ),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginSuccess) {
              context.push(AppRouter.islandView);
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? ''),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is AuthLoading) {
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
            image: AppStrings.loginBg,
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 11.w),
                              child: Text(
                                context.l10n.loginHeroNameTitle,
                                style: AppTextStyles.authFieldLabel,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            AuthTextFormField(
                              validator: (value) =>
                                  Validation.validateName(value!),
                              onSaved: (value) => _name = value ?? '',
                              borderRadius: 48.r,
                              prefixIcon: AppStrings.nameIcon,
                              hint: context.l10n.loginHeroNameHint,
                            ),
                            SizedBox(height: 23.h),
                            AuthDashedDivider(
                              color: AppColors.borders,
                              dashWidth: 4,
                              dashSpace: 8,
                              thickness: 3,
                            ),
                            SizedBox(height: 25.h),
                            ParentsSection(
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
                              context.read<AuthCubit>().login(
                                entity: UserEntity(
                                  childName: _name,
                                  email: _email,
                                  phone: _phone,
                                  password: _password,
                                ),
                              );
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
