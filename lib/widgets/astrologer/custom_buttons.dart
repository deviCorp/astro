import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? image;
  final Function()? ontap;
  const CustomButton({Key? key, this.image, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 32,
        width: 32,
        child: Image.asset(
          image!,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
