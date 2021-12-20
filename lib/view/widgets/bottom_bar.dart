import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/product_add_view.dart';
import '../screens/product_edit_view.dart';
import '../screens/product_search_view.dart';
import '../screens/products_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final screens = [
    const ProductsView(),
    const ProductEditView(),
    const ProductAddView(),
    ProductSearchView(),
    const ProductAddView(),
  ];

  final items = [
    const Icon(Icons.home, size: 30),
    //const  Icon(Icons.list, size: 30),
    const Icon(Icons.edit, size: 30),
    const Icon(Icons.add, size: 30),
    const Icon(Icons.search, size: 30),
    const Icon(Icons.perm_identity, size: 30),
  ];

  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text(''),
        ),
        body: screens[_page],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 60.0,
            items: items,
            color: Colors.blueAccent,
            buttonBackgroundColor: Colors.blueAccent,
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
                //Get.off(screens[index]);
              });
            },
            letIndexChange: (index) => true,
          ),
        ));
  }
}
