import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final Function()? onProfile;

  const CustomAppBar({
    Key? key,
    this.onProfile,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    'assets/images/hamburger.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 55,
                    height: 55,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 35,
                      height: 35,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
