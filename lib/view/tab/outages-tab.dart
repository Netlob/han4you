import 'package:flutter/material.dart';
import 'package:han4you/view/list/outage-list.dart';
import 'package:han4you/view/header.dart';

class OutagesTab extends StatefulWidget {
  @override
  _OutagesTabState createState() => _OutagesTabState();
}

class _OutagesTabState extends State<OutagesTab> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: 'Storingen', subtitle: 'storingen van HAN systemenen'),
        TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).accentColor,
          tabs: [
            Tab(
              icon: Icon(
                Icons.notifications_active_outlined,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.check,
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              OutageList(
                status: 'current',
              ),
              OutageList(
                status: 'fixed',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
