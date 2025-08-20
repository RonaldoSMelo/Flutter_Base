import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Color _primaryColor = Colors.blue;
  Color _accentColor = Colors.orange;
  bool _isDarkMode = false;
  double _fontSize = 14.0;
  bool _useCustomFont = false;

  // Getters
  ThemeMode get themeMode => _themeMode;
  Color get primaryColor => _primaryColor;
  Color get accentColor => _accentColor;
  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;
  bool get useCustomFont => _useCustomFont;

  // Temas predefinidos
  static const List<Color> _predefinedPrimaryColors = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
  ];

  static const List<Color> _predefinedAccentColors = [
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
  ];

  // Métodos para modificar o estado
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _isDarkMode = mode == ThemeMode.dark ||
        (mode == ThemeMode.system && _isSystemDarkMode());
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      _isDarkMode = true;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      _isDarkMode = false;
    } else {
      // Se for system, alterna baseado no estado atual
      _isDarkMode = !_isDarkMode;
      _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }

  void setPrimaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  void setAccentColor(Color color) {
    _accentColor = color;
    notifyListeners();
  }

  void setFontSize(double size) {
    if (size >= 10.0 && size <= 24.0) {
      _fontSize = size;
      notifyListeners();
    }
  }

  void toggleCustomFont() {
    _useCustomFont = !_useCustomFont;
    notifyListeners();
  }

  void resetToDefault() {
    _themeMode = ThemeMode.system;
    _primaryColor = Colors.blue;
    _accentColor = Colors.orange;
    _fontSize = 14.0;
    _useCustomFont = false;
    _isDarkMode = _isSystemDarkMode();
    notifyListeners();
  }

  void cyclePrimaryColor() {
    final currentIndex = _predefinedPrimaryColors.indexOf(_primaryColor);
    final nextIndex = (currentIndex + 1) % _predefinedPrimaryColors.length;
    _primaryColor = _predefinedPrimaryColors[nextIndex];
    notifyListeners();
  }

  void cycleAccentColor() {
    final currentIndex = _predefinedAccentColors.indexOf(_accentColor);
    final nextIndex = (currentIndex + 1) % _predefinedAccentColors.length;
    _accentColor = _predefinedAccentColors[nextIndex];
    notifyListeners();
  }

  // Verificar se o sistema está em modo escuro
  bool _isSystemDarkMode() {
    // Simulação - em um app real, isso seria verificado via MediaQuery
    return false;
  }

  // Obter o tema atual
  ThemeData getCurrentTheme() {
    final baseTheme = _isDarkMode ? ThemeData.dark() : ThemeData.light();

    return baseTheme.copyWith(
      primaryColor: _primaryColor,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: _primaryColor,
        secondary: _accentColor,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _accentColor,
        foregroundColor: Colors.white,
      ),
      textTheme: baseTheme.textTheme.apply(
        fontSizeFactor: _fontSize / 14.0,
        fontFamily: _useCustomFont ? 'Roboto' : null,
      ),
      cardTheme: CardThemeData(
        elevation: _isDarkMode ? 2 : 4,
        color: _isDarkMode ? Colors.grey[800] : Colors.white,
      ),
    );
  }

  // Obter lista de cores predefinidas
  List<Color> get predefinedPrimaryColors => _predefinedPrimaryColors;
  List<Color> get predefinedAccentColors => _predefinedAccentColors;
}
