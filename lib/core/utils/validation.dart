
import 'package:flutter/cupertino.dart';

import '../../features/auth/presentation/view/widgets/auth_gender_section.dart';
import '../../features/auth/presentation/view/widgets/auth_teacher_type_section.dart';

class Validation {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك أدخل الاسم';
    }
    return null;
  }

  static bool _isEmailValid(String email) {
    return RegExp(r'^[\w.-]+@[a-zA-Z]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل البريد الإلكتروني';
    } else if (!_isEmailValid(value)) {
      return 'من فضلك أدخل بريد إلكتروني صحيح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل كلمة المرور';
    } else if (value.length < 6) {
      return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, {
        TextEditingController? passwordController,
      }) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل كلمة المرور';
    } else if (value.length < 6) {
      return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
    } else if (value != passwordController?.text) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أدخل رقم الهاتف';
    } else if (!_isValidPhoneNumber(value)) {
      return 'من فضلك أدخل رقم هاتف صحيح';
    }
    return null;
  }

  static bool _isValidPhoneNumber(String phoneNumber) {
    const pattern = r'^[+]?[0-9]{10,13}$';
    return RegExp(pattern).hasMatch(phoneNumber);
  }

  static String? validateDropdown(String? value) {
    if (value == null) {
      return 'من فضلك اختر أحد الخيارات';
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (!RegExp(r'^\d$').hasMatch(value)) {
      return 'يجب إدخال رقم صحيح';
    }
    return null;
  }

  // Teacher Type Validation
  static String? validateTeacherType(TeacherType? value) {
    if (value == null) {
      return 'من فضلك اختر نوع المدرّس';
    }
    return null;
  }

  static String? validateGender(Gender? value) {
    if (value == null) {
      return 'من فضلك اختر النوع';
    }
    return null;
  }
}
