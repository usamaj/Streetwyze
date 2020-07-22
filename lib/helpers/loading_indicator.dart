import 'package:flutter/material.dart';
import 'package:streetwyze/config/settings.dart';


class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Setting.appColor),),
      );
}
class LoadingIndicatorWhite extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
      );
}
