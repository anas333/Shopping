import 'package:flutter/material.dart';

import 'my_item.dart';

class MyTapBar extends StatefulWidget {
  const MyTapBar({Key? key}) : super(key: key);

  @override
  _MyTapBarState createState() => _MyTapBarState();
}

class _MyTapBarState extends State<MyTapBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 1,
        ),
        Container(
          padding: const EdgeInsets.only(top: 0, left: 10),
          child: TabBar(
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            labelColor: Colors.blueGrey,
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.blueGrey),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: const EdgeInsets.only(bottom: 10),
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 0.7,
            controller: tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: 'T-Shirt'),
              Tab(
                text: 'Jeans',
              ),
              Tab(
                text: 'Sweeters',
              )
            ],
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          height: size.height * (0.33),
          child: TabBarView(controller: tabController, children: const [
            MyshirtItem(),
            Text('my walets'),
            Text('my shoes'),
          ]),
        ),
      ],
    );
  }
}
