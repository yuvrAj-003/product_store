// import "package:flutter/material.dart";

// class MaterialTheme {
//   final TextTheme textTheme;

//   const MaterialTheme(this.textTheme);

//   static ColorScheme lightScheme() {
//     return const 
//     );
//   }

//   ThemeData light() {
//     return theme(lightScheme());
//   }

//   static ColorScheme lightMediumContrastScheme() {
//     return const 
//   }

//   ThemeData lightMediumContrast() {
//     return theme(lightMediumContrastScheme());
//   }

//   static ColorScheme lightHighContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(4278200595),
//       surfaceTint: Color(4281166404),
//       onPrimary: Color(4294967295),
//       primaryContainer: Color(4278865195),
//       onPrimaryContainer: Color(4294967295),
//       secondary: Color(4279510553),
//       onSecondary: Color(4294967295),
//       secondaryContainer: Color(4281616185),
//       onSecondaryContainer: Color(4294967295),
//       tertiary: Color(4282519076),
//       onTertiary: Color(4294967295),
//       tertiaryContainer: Color(4285214533),
//       onTertiaryContainer: Color(4294967295),
//       error: Color(4283301890),
//       onError: Color(4294967295),
//       errorContainer: Color(4287365129),
//       onErrorContainer: Color(4294967295),
//       surface: Color(4294376435),
//       onSurface: Color(4278190080),
//       onSurfaceVariant: Color(4280165920),
//       outline: Color(4282205502),
//       outlineVariant: Color(4282205502),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4281086509),
//       inversePrimary: Color(4290444235),
//       primaryFixed: Color(4278865195),
//       onPrimaryFixed: Color(4294967295),
//       primaryFixedDim: Color(4278203674),
//       onPrimaryFixedVariant: Color(4294967295),
//       secondaryFixed: Color(4281616185),
//       onSecondaryFixed: Color(4294967295),
//       secondaryFixedDim: Color(4280168739),
//       onSecondaryFixedVariant: Color(4294967295),
//       tertiaryFixed: Color(4285214533),
//       onTertiaryFixed: Color(4294967295),
//       tertiaryFixedDim: Color(4283439406),
//       onTertiaryFixedVariant: Color(4294967295),
//       surfaceDim: Color(4292271060),
//       surfaceBright: Color(4294376435),
//       surfaceContainerLowest: Color(4294967295),
//       surfaceContainerLow: Color(4293981677),
//       surfaceContainer: Color(4293586920),
//       surfaceContainerHigh: Color(4293257954),
//       surfaceContainerHighest: Color(4292863197),
//     );
//   }

//   ThemeData lightHighContrast() {
//     return theme(lightHighContrastScheme());
//   }

//   static ColorScheme darkScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(4288009639),
//       surfaceTint: Color(4288009639),
//       onPrimary: Color(4278204701),
//       primaryContainer: Color(4279259438),
//       onPrimaryContainer: Color(4289851842),
//       secondary: Color(4290170041),
//       onSecondary: Color(4280431911),
//       secondaryContainer: Color(4281879357),
//       onSecondaryContainer: Color(4292012244),
//       tertiary: Color(4294947272),
//       onTertiary: Color(4283702578),
//       tertiaryContainer: Color(4285543240),
//       onTertiaryContainer: Color(4294957538),
//       error: Color(4294948011),
//       onError: Color(4285071365),
//       errorContainer: Color(4287823882),
//       onErrorContainer: Color(4294957782),
//       surface: Color(4279244048),
//       onSurface: Color(4292863197),
//       onSurfaceVariant: Color(4290824639),
//       outline: Color(4287337354),
//       outlineVariant: Color(4282468674),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4292863197),
//       inversePrimary: Color(4281166404),
//       primaryFixed: Color(4289851842),
//       onPrimaryFixed: Color(4278198542),
//       primaryFixedDim: Color(4288009639),
//       onPrimaryFixedVariant: Color(4279259438),
//       secondaryFixed: Color(4292012244),
//       onSecondaryFixed: Color(4279050003),
//       secondaryFixedDim: Color(4290170041),
//       onSecondaryFixedVariant: Color(4281879357),
//       tertiaryFixed: Color(4294957538),
//       onTertiaryFixed: Color(4281992989),
//       tertiaryFixedDim: Color(4294947272),
//       onTertiaryFixedVariant: Color(4285543240),
//       surfaceDim: Color(4279244048),
//       surfaceBright: Color(4281678390),
//       surfaceContainerLowest: Color(4278849291),
//       surfaceContainerLow: Color(4279770392),
//       surfaceContainer: Color(4280033564),
//       surfaceContainerHigh: Color(4280691495),
//       surfaceContainerHighest: Color(4281415217),
//     );
//   }

//   ThemeData dark() {
//     return theme(darkScheme());
//   }

//   static ColorScheme darkMediumContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(4288272811),
//       surfaceTint: Color(4288009639),
//       onPrimary: Color(4278197003),
//       primaryContainer: Color(4284587636),
//       onPrimaryContainer: Color(4278190080),
//       secondary: Color(4290433213),
//       onSecondary: Color(4278655502),
//       secondaryContainer: Color(4286682756),
//       onSecondaryContainer: Color(4278190080),
//       tertiary: Color(4294948812),
//       onTertiary: Color(4281532952),
//       tertiaryContainer: Color(4291197842),
//       onTertiaryContainer: Color(4278190080),
//       error: Color(4294949553),
//       onError: Color(4281794561),
//       errorContainer: Color(4294923337),
//       onErrorContainer: Color(4278190080),
//       surface: Color(4279244048),
//       onSurface: Color(4294442229),
//       onSurfaceVariant: Color(4291153347),
//       outline: Color(4288521628),
//       outlineVariant: Color(4286416253),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4292863197),
//       inversePrimary: Color(4279390768),
//       primaryFixed: Color(4289851842),
//       onPrimaryFixed: Color(4278195463),
//       primaryFixedDim: Color(4288009639),
//       onPrimaryFixedVariant: Color(4278206241),
//       secondaryFixed: Color(4292012244),
//       onSecondaryFixed: Color(4278392073),
//       secondaryFixedDim: Color(4290170041),
//       onSecondaryFixedVariant: Color(4280760877),
//       tertiaryFixed: Color(4294957538),
//       onTertiaryFixed: Color(4281008146),
//       tertiaryFixedDim: Color(4294947272),
//       onTertiaryFixedVariant: Color(4284162616),
//       surfaceDim: Color(4279244048),
//       surfaceBright: Color(4281678390),
//       surfaceContainerLowest: Color(4278849291),
//       surfaceContainerLow: Color(4279770392),
//       surfaceContainer: Color(4280033564),
//       surfaceContainerHigh: Color(4280691495),
//       surfaceContainerHighest: Color(4281415217),
//     );
//   }

//   ThemeData darkMediumContrast() {
//     return theme(darkMediumContrastScheme());
//   }

//   static ColorScheme darkHighContrastScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(4293918703),
//       surfaceTint: Color(4288009639),
//       onPrimary: Color(4278190080),
//       primaryContainer: Color(4288272811),
//       onPrimaryContainer: Color(4278190080),
//       secondary: Color(4293918703),
//       onSecondary: Color(4278190080),
//       secondaryContainer: Color(4290433213),
//       onSecondaryContainer: Color(4278190080),
//       tertiary: Color(4294965753),
//       onTertiary: Color(4278190080),
//       tertiaryContainer: Color(4294948812),
//       onTertiaryContainer: Color(4278190080),
//       error: Color(4294965753),
//       onError: Color(4278190080),
//       errorContainer: Color(4294949553),
//       onErrorContainer: Color(4278190080),
//       surface: Color(4279244048),
//       onSurface: Color(4294967295),
//       onSurfaceVariant: Color(4294311411),
//       outline: Color(4291153347),
//       outlineVariant: Color(4291153347),
//       shadow: Color(4278190080),
//       scrim: Color(4278190080),
//       inverseSurface: Color(4292863197),
//       inversePrimary: Color(4278202904),
//       primaryFixed: Color(4290115270),
//       onPrimaryFixed: Color(4278190080),
//       primaryFixedDim: Color(4288272811),
//       onPrimaryFixedVariant: Color(4278197003),
//       secondaryFixed: Color(4292275672),
//       onSecondaryFixed: Color(4278190080),
//       secondaryFixedDim: Color(4290433213),
//       onSecondaryFixedVariant: Color(4278655502),
//       tertiaryFixed: Color(4294959078),
//       onTertiaryFixed: Color(4278190080),
//       tertiaryFixedDim: Color(4294948812),
//       onTertiaryFixedVariant: Color(4281532952),
//       surfaceDim: Color(4279244048),
//       surfaceBright: Color(4281678390),
//       surfaceContainerLowest: Color(4278849291),
//       surfaceContainerLow: Color(4279770392),
//       surfaceContainer: Color(4280033564),
//       surfaceContainerHigh: Color(4280691495),
//       surfaceContainerHighest: Color(4281415217),
//     );
//   }

//   ThemeData darkHighContrast() {
//     return theme(darkHighContrastScheme());
//   }


//   ThemeData theme(ColorScheme colorScheme) => ThemeData(
//      useMaterial3: true,
//      brightness: colorScheme.brightness,
//      colorScheme: colorScheme,
//      textTheme: textTheme.apply(
//        bodyColor: colorScheme.onSurface,
//        displayColor: colorScheme.onSurface,
//      ),
//      scaffoldBackgroundColor: colorScheme.background,
//      canvasColor: colorScheme.surface,
//   );


//   List<ExtendedColor> get extendedColors => [
//   ];
// }

// class ExtendedColor {
//   final Color seed, value;
//   final ColorFamily light;
//   final ColorFamily lightHighContrast;
//   final ColorFamily lightMediumContrast;
//   final ColorFamily dark;
//   final ColorFamily darkHighContrast;
//   final ColorFamily darkMediumContrast;

//   const ExtendedColor({
//     required this.seed,
//     required this.value,
//     required this.light,
//     required this.lightHighContrast,
//     required this.lightMediumContrast,
//     required this.dark,
//     required this.darkHighContrast,
//     required this.darkMediumContrast,
//   });
// }

// class ColorFamily {
//   const ColorFamily({
//     required this.color,
//     required this.onColor,
//     required this.colorContainer,
//     required this.onColorContainer,
//   });

//   final Color color;
//   final Color onColor;
//   final Color colorContainer;
//   final Color onColorContainer;
// }
