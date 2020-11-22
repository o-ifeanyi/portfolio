import 'package:flutter_icons/flutter_icons.dart';

import './models/skill.dart';

final List<Skill> skillList = [
  Skill(
    id: 0,
    icon: FontAwesome.android,
    title: 'Android Apps',
    description:
        'Build and deploy beautiful, responsive and well tested apps on Play store.',
  ),
  Skill(
    id: 1,
    icon: FontAwesome.apple,
    title: 'IOS Apps',
    description:
        'Build and deploy beautiful, responsive and well tested apps on App store.',
  ),
  Skill(
    id: 2,
    icon: MaterialCommunityIcons.web,
    title: 'Web Apps',
    description:
        'Build and host responsive webapps that looks beautiful on all screen sizes.',
  ),
  Skill(
    id: 3,
    icon: MaterialCommunityIcons.desktop_mac_dashboard,
    title: 'Desktop Apps',
    description:
        'Build responsive desktop applications that can run on Windows, Mac OS and Linux.',
  ),
];
