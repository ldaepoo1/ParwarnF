import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class Skillcell extends StatelessWidget {
  @required
  final Skilldata skilldata;
  const Skillcell(this.skilldata, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ClipRRect(
                  child: Hero(
                    tag: 'imgae${skilldata.id}',
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: skilldata.icon,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  skilldata.name,
                  style: textStyle24bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
