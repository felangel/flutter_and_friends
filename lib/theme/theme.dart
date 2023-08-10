import 'package:flutter/material.dart';
import 'package:flutter_and_friends/theme/theme.dart';

export 'cubit/theme_cubit.dart';

final lightTheme = ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
final darkTheme = ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF0060AA),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD3E4FF),
  onPrimaryContainer: Color(0xFF001C38),
  secondary: Color(0xFF9C413C),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDAD6),
  onSecondaryContainer: Color(0xFF410003),
  tertiary: Color(0xFF654CB3),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFE8DEFF),
  onTertiaryContainer: Color(0xFF20005F),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  outline: Color(0xFF73777F),
  background: Color(0xFFFDFCFF),
  onBackground: Color(0xFF1A1C1E),
  surface: Color(0xFFFAF9FD),
  onSurface: Color(0xFF1A1C1E),
  surfaceVariant: Color(0xFFDFE2EB),
  onSurfaceVariant: Color(0xFF43474E),
  inverseSurface: Color(0xFF2F3033),
  onInverseSurface: Color(0xFFF1F0F4),
  inversePrimary: Color(0xFFA2C9FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF0060AA),
  outlineVariant: Color(0xFFC3C6CF),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFA2C9FF),
  onPrimary: Color(0xFF00315C),
  primaryContainer: Color(0xFF004881),
  onPrimaryContainer: Color(0xFFD3E4FF),
  secondary: Color(0xFFFFB3AD),
  onSecondary: Color(0xFF5F1413),
  secondaryContainer: Color(0xFF7E2A27),
  onSecondaryContainer: Color(0xFFFFDAD6),
  tertiary: Color(0xFFCDBDFF),
  onTertiary: Color(0xFF361682),
  tertiaryContainer: Color(0xFF4D3399),
  onTertiaryContainer: Color(0xFFE8DEFF),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  outline: Color(0xFF8D9199),
  background: Color(0xFF1A1C1E),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF121316),
  onSurface: Color(0xFFC6C6CA),
  surfaceVariant: Color(0xFF43474E),
  onSurfaceVariant: Color(0xFFC3C6CF),
  inverseSurface: Color(0xFFE3E2E6),
  onInverseSurface: Color(0xFF1A1C1E),
  inversePrimary: Color(0xFF0060AA),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFA2C9FF),
  outlineVariant: Color(0xFF43474E),
  scrim: Color(0xFF000000),
);

extension ThemeStateX on ThemeState {
  ThemeMode toThemeMode() {
    return this == ThemeState.dark ? ThemeMode.dark : ThemeMode.light;
  }
}
