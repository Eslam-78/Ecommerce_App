import 'package:flutter/material.dart';

const Color purpleText = Color(0xFF9C27B0); // بنفسجي أنيق
const Color blackBackground = Color(0xFF121212); // أسود ناعم للخلفية

// الألوان الأساسية
const Color primary = Color(0xFF0D47A1); // أزرق
const Color secondary = Color(0xFF1976D2); // أزرق فاتح
const Color accent = Color(0xFFFFC107); // أصفر مميز

// ألوان إضافية
const Color background = Color(0xFFF5F5F5); // خلفية افتراضية فاتحة
const Color textPrimary = Color(0xFF212121); // نص أساسي غامق
const Color textSecondary = Color(0xFF757575); // نص ثانوي

const Color success = Color(0xFF4CAF50); // أخضر للنجاح
const Color error = Color(0xFFF44336); // أحمر للخطأ
const Color warning = Color(0xFFFF9800); // برتقالي للتحذير
const Color iconColor = Color.fromARGB(255, 194, 89, 212); //للايكونات
Color containerColor = Color.fromARGB(255, 93, 15, 106).withOpacity(0.1);
const int maxImageSizeMB = 300; // الحد الأقصى لحجم الصورة بالميجابايت
const List<String> allowedImageExtensions = ['.jpg', '.jpeg', '.gif'];

//Form errors
final RegExp emailRegex = RegExp(
  r'^[a-zA-Z]{3,}[a-zA-Z0-9]*@(gmail|hotmail|yahoo|mail|outlook|example)\.(com|ru|net|org)$',
);

final RegExp nameRegex = RegExp(
  r'^([A-Z\u0600-\u06FF][a-z\u0600-\u06FF\s]{2,}|[\u0600-\u06FF][\u0600-\u06FF\s]{2,})$',
);

final RegExp passwordStrengthRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).+$');

final RegExp phoneRegex = RegExp(r'^\+?[\d\s\-]{8,15}$');
const String emptyEmailField = "Email Field is empty";
const String emptyPassField = "Password Field is empty";
const String emptyFirstNameField = "First Name Field is empty";
const String emptyLastNameField = "Last Name Field is empty";
const String passwordMatchingError = "Password don't match";
const String emailPatternError = "Invalid email pattern";
const String nameFPatternError = "Invalid  first name pattern";
const String nameLPatternError = "Invalid  last name pattern";
const String shortPassError = "Your Password is short!";
