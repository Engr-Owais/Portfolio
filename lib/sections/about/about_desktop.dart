import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/about_utils.dart';

import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/about_me_data.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/tech_widget.dart';

import 'package:universal_html/html.dart' as html;

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          const CustomSectionSubHeading(
            text: 'Get to know me :)',
          ),
          Space.y1!,
          Container(
            padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Who am I?',
                  style: AppText.b1!.copyWith(
                    color: AppTheme.c!.primary,
                  ),
                ),
                Space.y1!,
                Text(
                  AboutUtils.aboutMeHeadline,
                  style: AppText.b1b!.copyWith(
                    fontFamily: 'Montserrat',
                  ),
                ),
                Space.y!,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Text(
                    AboutUtils.aboutMeDetail,
                    style: AppText.b2!.copyWith(
                      height: 2,
                      letterSpacing: 1.1,
                      fontFamily: 'Montserrat',
                      fontSize: AppDimensions.normalize(5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Space.y!,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Divider(
                    color: Colors.grey[800],
                    thickness: AppDimensions.normalize(0.5),
                  ),
                ),
                Space.y!,
                Text(
                  'Technologies I have worked with:',
                  style: AppText.l1!.copyWith(
                    color: AppTheme.c!.primary,
                  ),
                ),
                Space.y!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: kTools
                      .map((e) => ToolTechWidget(
                            techName: e,
                          ))
                      .toList(),
                ),
                Space.y!,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Divider(
                    color: Colors.grey[800],
                    thickness: AppDimensions.normalize(0.5),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutMeData(
                            data: "Name",
                            information: "Owais Taha",
                          ),
                          AboutMeData(
                            data: "Age",
                            information: "24",
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutMeData(
                            data: "Email",
                            information: "owaistaha67@gmail.com",
                          ),
                          AboutMeData(
                            data: "From",
                            information: "Karachi, PK",
                          ),
                          AboutMeData(
                            data: "Residing",
                            information: "Subang Jaya, Malaysia",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Space.y1!,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: AppDimensions.normalize(13),
                        width: AppDimensions.normalize(40),
                        child: OutlinedButton(
                          onPressed: () =>
                              html.window.open(StaticUtils.resume, 'pdf'),
                          child: const Text(
                            "Resume",
                          ),
                        ),
                      ),
                      Space.x1!,
                      Container(
                        color: Colors.grey[900]!,
                        width: AppDimensions.normalize(30),
                        height: AppDimensions.normalize(0.5),
                      ),
                      ...WorkUtils.logos.asMap().entries.map(
                            (e) => CommunityIconBtn(
                              icon: e.value,
                              link: WorkUtils.communityLinks[e.key],
                              height: WorkUtils.communityLogoHeight[e.key],
                            ),
                          )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width < 1230 ? width * 0.05 : width * 0.1,
          )
        ],
      ),
    );
  }
}
