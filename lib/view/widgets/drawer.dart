import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:programming_language_project/model/classes/serve.dart';

import '../../routs.dart';

//import 'logen.dart';

class MyDrawers extends StatefulWidget {
  const MyDrawers({Key? key}) : super(key: key);

  @override
  _MyDrawersState createState() => _MyDrawersState();
}

class _MyDrawersState extends State<MyDrawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 25,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.grey[700]),
            accountName: const Text("Ahmad Kasem"),
            accountEmail: const Text('ahmad.dxdr@gmail.com'),
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Colors.red,
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
              iconSize: 25,
              color: Colors.blue[900],
            ),
            title: Text(
              translator.translate("home"),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.category),
              iconSize: 25,
              color: Colors.blue[900],
            ),
            title: Text(
              translator.translate("Sections"),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),

          // ListTile(
          //   leading: IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.settings),
          //     iconSize: 25,
          //     color: Colors.blue[900],
          //   ),
          //   title: Text(
          //     translator.translate("tSetting"),
          //     style: TextStyle(fontSize: 20, color: Colors.black),
          //   ),
          // ),
          ExpansionTile(
            title: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.blue[900],
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  translator.translate("Setting"),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                // Icon(
                //   Icons.keyboard_arrow_down_sharp,
                //   color: Colors.yellowAccent,
                //   // size: 170,
                // ),
              ],
            ),
            //   tilePadding: EdgeInsets.all(1),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: const EdgeInsets.all(1),
            children: [
              Column(
                children: [
                  ListTile(
                    leading: IconButton(
                      onPressed: () {
                        translator.setNewLanguage(context,
                            newLanguage: translator.currentLanguage == 'ar'
                                ? 'en'
                                : 'ar');
                      },
                      icon: const Icon(Icons.blur_linear_sharp),
                      iconSize: 25,
                      color: Colors.blue[900],
                    ),
                    title: Text(
                      translator.translate('language'),
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {
                        //notifyHelper.scheduledNotification();
                        ThemeServices().switchTeme();
                      },
                      icon: Icon(
                        Get.isDarkMode
                            ? Icons.wb_sunny_outlined
                            : Icons.nightlight_round,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    title: Text(
                      translator.translate('Mode'),
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Login(),
                        //   ),
                        // );
                        Get.offAndToNamed(Routes.login);
                      },
                      icon: const Icon(Icons.exit_to_app),
                      iconSize: 25,
                      color: Colors.blue[900],
                    ),
                    title: Text(
                      translator.translate("Log out"),
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  //   Text(
                  //     'Reset Password',
                  // style: TextStyle(fontSize: 20, color: Colors.black),
                  //     ),
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.only(bottom: 20),
              // ),
            ],
          ),
          const Divider(
            color: Colors.blueGrey,
            thickness: 3,
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
              iconSize: 25,
              color: Colors.blue[900],
            ),
            title: Text(
              translator.translate("share"),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info),
              iconSize: 25,
              color: Colors.blue[900],
            ),
            title: Text(
              translator.translate("about"),
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),

          // Wrap(
          //   children: translator.locals().map((i) {
          //     return Align(
          //       alignment: translator.currentLanguage == 'en'
          //           ? Alignment.bottomLeft
          //           : Alignment.bottomRight,
          //       child: OutlinedButton(
          //         onPressed: () {
          //           translator.setNewLanguage(
          //             context,
          //             newLanguage: i.languageCode,
          //             remember: true,
          //             restart: true,
          //           );
          //         },
          //         child: Text(i.languageCode),
          //       ),
          //     );
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}
