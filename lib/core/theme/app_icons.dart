import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  // Navigation Icons
  static const String _homePath = 'assets/images/icons/home';
  static const String _navigationPath = 'assets/images/icons/navigation';
  static const String _searchPath = 'assets/images/icons/search';

  static _icon(String path, double? size, Color? color) => SvgPicture.asset(
        path,
        width: size,
        height: size,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );

  // Home Icons
  static Widget location({double? size, Color? color}) =>
      _icon('$_homePath/location.svg', size, color);

  // Navigation Icons
  static Widget chat({double? size, Color? color}) =>
      _icon('$_navigationPath/chat.svg', size, color);

  static Widget favorite({double? size, Color? color}) =>
      _icon('$_navigationPath/favorite.svg', size, color);

  static Widget home({double? size, Color? color}) =>
      _icon('$_navigationPath/home.svg', size, color);

  static Widget profile({double? size, Color? color}) =>
      _icon('$_navigationPath/profile.svg', size, color);

  static Widget search({double? size, Color? color}) =>
      _icon('$_navigationPath/search.svg', size, color);

  // Search Icons
  static Widget layer({double? size, Color? color}) =>
      _icon('$_searchPath/layer.svg', size, color);

  static Widget list({double? size, Color? color}) =>
      _icon('$_searchPath/list.svg', size, color);

  static Widget send({double? size, Color? color}) =>
      _icon('$_searchPath/send.svg', size, color);

  static Widget building({double? size, Color? color}) =>
      _icon('$_searchPath/building.svg', size, color);

  static Widget searchOutlined({double? size, Color? color}) =>
      _icon('$_searchPath/search_outlined.svg', size, color);

  static Widget filter({double? size, Color? color}) =>
      _icon('$_searchPath/filter.svg', size, color);

  static Widget cart({double? size, Color? color}) =>
      _icon('$_searchPath/cart.svg', size, color);

  static Widget shield({double? size, Color? color}) =>
      _icon('$_searchPath/shield.svg', size, color);

  static Widget wallet({double? size, Color? color}) =>
      _icon('$_searchPath/wallet.svg', size, color);
}
