//Search Page
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Modules/Skills/Page/selectskills/searchskills/search_controller.dart';
import 'package:plawarn/Modules/Skills/Page/selectskills/widget/api/skill_data.dart';

import 'package:plawarn/widget/model/dtos/skill/all_skill.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class Searchskillall extends StatefulWidget {
  const Searchskillall({super.key});

  @override
  State<Searchskillall> createState() => _SearchskillallState();
}

class _SearchskillallState extends State<Searchskillall> {
  final chskill = Get.put(SearchskillallController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.blueAccent,
            iconSize: 18,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        elevation: 0,
        leadingWidth: 30,
        title: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: colord,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: colorc)),
          child: TextField(
            //search box
            controller: chskill.searchController,
            focusNode: chskill.focusNode,
            onChanged: chskill.searchOperation,
            decoration: const InputDecoration(
              hintText: 'ค้นหาทักษะ',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              //Card Checkbox skills
              child: FutureBuilder<List<Skillall>>(
                future: SkillallRequest.fetchSkill(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final skill = snapshot.data![index];

                        return Column(
                          children: <Widget>[
                            Card(
                              child: GFCheckboxListTile(
                                avatar: skill.icon != null
                                    ? Image.network(
                                        skill.icon!,
                                        scale: 2,
                                      )
                                    : const Icon(Icons.image),
                                type: GFCheckboxType.basic,
                                size: 25,
                                inactiveBgColor: colorE,
                                activeBorderColor: colorG,
                                title:
                                    Text(skill.name!, style: textStyle20bold),
                                value:
                                    chskill.skillsChecked.contains(skill.name!),
                                onChanged: (val) {
                                  chskill.onSelected(val, skill.name!);
                                  // if (value == true &&
                                  //     skillsChecked.length <= 3) {
                                  //   skillsChecked.add(skill.name!);
                                  //   print(skillsChecked);
                                  // } else {
                                  //   skillsChecked.remove(skill.name!);
                                  // }
                                },
                              ),
                            ),
                            FutureBuilder(
                              future: SkillallRequest.fetchSkill(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: skill.childrens!.length,
                                    itemBuilder: (context, index) {
                                      final child = skill.childrens![index];
                                      return Card(
                                        child: GFCheckboxListTile(
                                          size: 25,
                                          inactiveBgColor: colorE,
                                          activeBorderColor: colorG,
                                          title: Text(
                                            child.name!,
                                            style: textStyle18bold,
                                          ),
                                          value: chskill.skillsChecked
                                              .contains(child.name!),
                                          onChanged: (val) {
                                            chskill.onSelected(
                                                val, child.name!);
                                            print(child.name!);
                                          },
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
