import 'package:flutter/material.dart';

@immutable
final class AppColors {
  //*COMMON COLORS
  static const kBackground = Color(0xFFF5F5F5);
  static const kWhite = Colors.white;
  static const kBlack = Colors.black;
  static const kPurple = Color(0xFF613EEF);
  static const kTaksi = Color(0xFFF5E0A8); // Taksi color
  static const kRed100 = Color(0xFFDA4949); // Red color 100%

  //?PRIMARY COLORS
  static const kPrimary100 = Color(0xFF0077C9); // New blue color (0, 119, 201)
  static const kPrimary75 = Color(0xB20077C9); // New blue color 75% opacity
  static const kPrimary50 = Color(0x800077C9); // New blue color 50% opacity
  static const kPrimary15 = Color(0x260077C9); // New blue color 15% opacity
  static const kPrimary7 = Color(0x120077C9); // New blue color 7% opacity
  static const kPrimarySoluk = Color(0xFFF1B9AD); // Soluk color

  //?SECONDARY COLORS
  static const kSecondary900 = Color(0xFF3B464E);
  static const kSecondary800 = Color(0xFF4E5B65);
  static const kSecondary700 = Color(0xFF62707B);
  static const kSecondary600 = Color(0xFF778692);
  static const kSecondary500 = Color(0xFF8C9CA9);
  static const kSecondary400 = Color(0xFFA3B3BF);
  static const kSecondary300 = Color(0xFFBAC9D6);
  static const kSecondary200 = Color(0xFFD2E1ED);
  static const kSecondary100 = Color(0xFFE6F4FF);

  //*SUCCESS COLORS
  static const kSuccess900 = Color(0xFF068133);
  static const kSuccess800 = Color(0xFF12A347);
  static const kSuccess700 = Color(0xFF22C55E);
  static const kSuccess600 = Color(0xFF36E777);
  static const kSuccess500 = Color(0xFF4CFF8E);
  static const kSuccess400 = Color(0xFF74FFA7);
  static const kSuccess300 = Color(0xFF9CFFC1);
  static const kSuccess200 = Color(0xFFC5FFDA);
  static const kSuccess100 = Color(0xFFEDFFF3);
  static const kIdeaSoftGreen = Color(0xFFA3D35E); // New green color (163, 211, 94)

  //!DANGER COLORS
  static const kDanger900 = Color(0xFF450303);
  static const kDanger800 = Color(0xFF891313);
  static const kDanger700 = Color(0xFFAB2020);
  static const kDanger600 = Color(0xFFCD3030);
  static const kDanger500 = Color(0xFFEF4444);
  static const kDanger400 = Color(0xFFFE7171);
  static const kDanger300 = Color(0xFFFF9A9A);
  static const kDanger200 = Color(0xFFFFC4C4);
  static const kDanger100 = Color(0xFFFFEDED);

  //*WARNING COLORS
  static const kWarning900 = Color(0xFF775A00);
  static const kWarning800 = Color(0xFF997608);
  static const kWarning700 = Color(0xFFBB9213);
  static const kWarning600 = Color(0xFFDDB022);
  static const kWarning500 = Color(0xFFFFCE35);
  static const kWarning400 = Color(0xFFFFD962);
  static const kWarning300 = Color(0xFFFFE490);
  static const kWarning200 = Color(0xFFFFEFBD);
  static const kWarning100 = Color(0xFFFFFAEB);

  //?INFO COLORS
  static const kInfo900 = Color(0xFF00404D);
  static const kInfo800 = Color(0xFF006276);
  static const kInfo700 = Color(0xFF00849E);
  static const kInfo600 = Color(0xFF00A6C7);
  static const kInfo500 = Color(0xFF0DCAF0);
  static const kInfo400 = Color(0xFF39DEFF);
  static const kInfo300 = Color(0xFF65E5FF);
  static const kInfo200 = Color(0xFF90ECFF);
  static const kInfo100 = Color(0xFFBBF3FF);

  //* CUSTOM COLORS
  static const accepted = Color(0xFF16A34A); // rgb(22, 163, 74)
  static const waiting = Color(0xFFEAB308); // rgb(234, 179, 8)
  static const rejected = Color(0xFFDC2626); // rgb(220, 38, 38)
  static const notConsider = Color(0xFF2563EB); // rgb(37, 99, 235)
  static const satisIptalEdildi = Color(0xFF7C3AED); // rgb(124, 58, 237)
  static const musteriTeklifiIptalEtti = Color(0xFF525252); // rgb(82, 82, 82)
  static const hemenAlTeklifIleUrunSatildi = Color(0xFFEA580C); // rgb(234, 88, 12)
  static const hemenAl = Color(0xFFEA580C); // rgb(234, 88, 12)
  static const disabledColor = Color(0xFF94A3B8); // rgb(148, 163, 184)

  //*SUCCESS COLORS
  static const kSuccessBorder = Color(0xFF4ADE80); // border: rgb(74 222 128)
  static const kSuccessBg = Color(0xFFF0FDF4); // bg: rgb(240 253 244)
  static const kSuccessText = Color(0xFF15803D); // text-color: rgb(21 128 61)

  //!DANGER COLORS
  static const kDangerBorder = Color(0xFFF87171); // border: rgb(248 113 113)
  static const kDangerBg = Color(0xFFFEE2E2); // bg: rgb(254 242 242)
  static const kDangerText = Color(0xFFB91C1C); // text-color: rgb(185 28 28)
}
