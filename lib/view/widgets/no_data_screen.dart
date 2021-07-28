import 'package:flutter/material.dart';
import 'package:tutorial/localization/language_constrants.dart';
import 'package:tutorial/util/dimensions.dart';
import 'package:tutorial/util/image.dart';
import 'package:tutorial/util/styles.dart';

class NoDataScreen extends StatelessWidget {
  final bool isCart;
  final bool isNothing;

  NoDataScreen({this.isCart = false, this.isNothing = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Image.network(
          isCart ? Images.shopping_cart : Images.binoculars,
          width: MediaQuery.of(context).size.height * 0.22, height: MediaQuery.of(context).size.height * 0.22,
          //color: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 15),
        Text(
          getTranslated(isCart ? 'empty_cart' : 'nothing_found', context),
          style: poppinsBold.copyWith(color: Theme.of(context).primaryColor, fontSize: MediaQuery.of(context).size.height * 0.023),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          isCart ? getTranslated('look_like_have_not_added', context) : '',
          style: poppinsMedium.copyWith(fontSize: MediaQuery.of(context).size.height * 0.0175),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
