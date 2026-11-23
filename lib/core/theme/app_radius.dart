import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Design system border radius tokens.
/// Utiliza el paquete [sizer] para proporcionar una escala responsiva según el tamaño de la pantalla.
abstract final class AppRadius {
  // ---------------------------------------------------------------------------
  // Constantes estáticas base (útiles para temas estáticos y sin BuildContext)
  // ---------------------------------------------------------------------------
  static const double rawXs = 2.0;
  static const double rawSm = 4.0;
  static const double rawDefault = 8.0;
  static const double rawMd = 12.0;
  static const double rawLg = 16.0;
  static const double rawXl = 24.0;
  static const double rawXxl = 32.0;
  static const double rawFull = 9999.0;

  // ---------------------------------------------------------------------------
  // Valores escalables responsivos (Sizer)
  // ---------------------------------------------------------------------------
  /// Radio extra pequeño (~2 - 4dp)
  static double get xs => 0.8.w;

  /// Radio pequeño (~4 - 6dp)
  static double get sm => 1.2.w;

  /// Radio por defecto / base (~8dp)
  static double get defaultValue => 2.0.w;

  /// Alias de compatibilidad para el radio base.
  static double get defaultRadius => defaultValue;

  /// Radio mediano (~12dp)
  static double get md => 3.0.w;

  /// Radio grande (~16dp)
  static double get lg => 4.0.w;

  /// Radio extra grande (~24dp)
  static double get xl => 6.0.w;

  /// Radio extra extra grande (~32dp)
  static double get xxl => 8.0.w;

  /// Radio completamente redondeado / píldora
  static const double full = 9999.0;

  // ---------------------------------------------------------------------------
  // Objetos Radius responsivos
  // ---------------------------------------------------------------------------
  static Radius get circularXs => Radius.circular(xs);
  static Radius get circularSm => Radius.circular(sm);
  static Radius get circularDefault => Radius.circular(defaultValue);
  static Radius get circularMd => Radius.circular(md);
  static Radius get circularLg => Radius.circular(lg);
  static Radius get circularXl => Radius.circular(xl);
  static Radius get circularXxl => Radius.circular(xxl);
  static const Radius circularFull = Radius.circular(full);

  // ---------------------------------------------------------------------------
  // Objetos BorderRadius circulares responsivos
  // ---------------------------------------------------------------------------
  static BorderRadius get roundedXs => BorderRadius.circular(xs);
  static BorderRadius get roundedSm => BorderRadius.circular(sm);
  static BorderRadius get roundedDefault => BorderRadius.circular(defaultValue);
  static BorderRadius get roundedMd => BorderRadius.circular(md);
  static BorderRadius get roundedLg => BorderRadius.circular(lg);
  static BorderRadius get roundedXl => BorderRadius.circular(xl);
  static BorderRadius get roundedXxl => BorderRadius.circular(xxl);
  static const BorderRadius roundedFull = BorderRadius.all(circularFull);

  // ---------------------------------------------------------------------------
  // Utilidades de BorderRadius direccionales
  // ---------------------------------------------------------------------------
  /// Bordes redondeados solo superiores
  static BorderRadius top(double radius) =>
      BorderRadius.vertical(top: Radius.circular(radius));
  static BorderRadius get topSm => BorderRadius.vertical(top: circularSm);
  static BorderRadius get topMd => BorderRadius.vertical(top: circularMd);
  static BorderRadius get topLg => BorderRadius.vertical(top: circularLg);
  static BorderRadius get topXl => BorderRadius.vertical(top: circularXl);

  /// Bordes redondeados solo inferiores
  static BorderRadius bottom(double radius) =>
      BorderRadius.vertical(bottom: Radius.circular(radius));
  static BorderRadius get bottomSm => BorderRadius.vertical(bottom: circularSm);
  static BorderRadius get bottomMd => BorderRadius.vertical(bottom: circularMd);
  static BorderRadius get bottomLg => BorderRadius.vertical(bottom: circularLg);
  static BorderRadius get bottomXl => BorderRadius.vertical(bottom: circularXl);

  /// Bordes redondeados solo a la izquierda
  static BorderRadius left(double radius) =>
      BorderRadius.horizontal(left: Radius.circular(radius));

  /// Bordes redondeados solo a la derecha
  static BorderRadius right(double radius) =>
      BorderRadius.horizontal(right: Radius.circular(radius));

  /// Generador personalizado de BorderRadius circular
  static BorderRadius circular(double radius) => BorderRadius.circular(radius);
}

/// Pre-built [BorderRadius] instances for Flutter widgets.
abstract final class AppBorderRadius {
  /// 4.0 px radius
  static BorderRadius get sm => BorderRadius.circular(AppRadius.sm);

  /// 8.0 px radius
  static BorderRadius get defaultRadius =>
      BorderRadius.circular(AppRadius.defaultValue);

  /// 12.0 px radius
  static BorderRadius get md => BorderRadius.circular(AppRadius.md);

  /// 16.0 px radius - Media posters & cards
  static BorderRadius get lg => BorderRadius.circular(AppRadius.lg);

  /// 24.0 px radius - Bottom navigation docks, bottom sheets
  static BorderRadius get xl => BorderRadius.circular(AppRadius.xl);

  /// Full Pill radius (9999.0 px)
  static const BorderRadius full = BorderRadius.all(
    Radius.circular(AppRadius.rawFull),
  );
}
