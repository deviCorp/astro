import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';

class CustomListTile extends StatelessWidget {
  final String? img;
  final String? name;
  final String? skills;
  final String? languages;
  final String? rates;
  final String? experience;
  const CustomListTile({
    Key? key,
    this.img,
    this.name,
    this.skills,
    this.languages,
    this.rates,
    this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget subtitle(icon, content, {textStyle}) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                icon,
                width: 15,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  content,
                  style: textStyle ??
                      bodyStyle(context: context, size: 12, color: black),
                ),
              )
            ],
          ),
        );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  imageUrl: img!,
                  progressIndicatorBuilder: (BuildContext context, String s,
                      DownloadProgress loadingProgress) {
                    return const SpinKitThreeBounce(
                      color: brown,
                      size: 20.0,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: headingStyle(
                          context: context, size: 15, color: black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    subtitle('assets/images/skills.png', skills),
                    subtitle('assets/images/language.png', languages),
                    subtitle('assets/images/rates.png', '$rates/MIN',
                        textStyle: const TextStyle(
                            fontFamily: roboto,
                            color: black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Text(
                '$experience Years',
              )
            ],
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: brown,
                  primary: Colors.white,
                  textStyle: bodyStyle(
                      context: context, size: 14, color: Colors.white)),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.phone,
                  ),
                  Text(
                    'Talk to call',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
