import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/modules/skills/page/selectskills/select_skills.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class ColounmAddSkill extends StatelessWidget {
  const ColounmAddSkill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 17, 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                  ),
                  child: GFBorder(
                    dashedLine: const [4, 6],
                    type: GFBorderType.rect,
                    color: blurpimary,
                    child: TextButton(
                        child: const Text(
                          'ทักษะที่ 1',
                          style: SkillsTextStyle18,
                        ),
                        onPressed: () {
                          Get.to(() => Selectskill(),
                              // duration: const Duration(seconds: 1),
                              transition: Transition.rightToLeft);
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                  ),
                  child: GFBorder(
                    dashedLine: const [4, 6],
                    type: GFBorderType.rect,
                    color: blurpimary,
                    child: TextButton(
                      child: const Text(
                        'ทักษะที่ 2',
                        style: SkillsTextStyle18,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/ListChild');
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                  ),
                  child: GFBorder(
                    dashedLine: const [4, 6],
                    type: GFBorderType.rect,
                    color: blurpimary,
                    child: TextButton(
                      child: const Text(
                        'ทักษะที่ 3',
                        style: SkillsTextStyle18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
