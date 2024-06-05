import 'package:dokan_app/utils/constants/constants.dart';

class ProfileOptions {
  final String _iconSvgPath;
  final String _title;
  final bool _isLast;

  ProfileOptions(this._iconSvgPath, this._title, this._isLast);

  String get iconSvgPath => _iconSvgPath;

  String get title => _title;

  bool get isLast => _isLast;


  static List<ProfileOptions> options = [
    ProfileOptions(AppSvgIcons.user, 'Account', false),
    ProfileOptions(AppSvgIcons.pass, 'Password', false),
    ProfileOptions(AppSvgIcons.bell, 'Notification', false),
    ProfileOptions(AppSvgIcons.heart, 'Wishlist', true),
  ];

}