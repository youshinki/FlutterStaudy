import 'package:flutter/material.dart';
import 'conversations.dart';
import 'tasks.dart';
import 'contacts.dart';
class MyTabbedPage extends StatefulWidget {
   const MyTabbedPage({ Key key }) : super(key: key);
   @override
   _MyTabbedPageState createState() => _MyTabbedPageState();
 }

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
 final List<Tab> myTabs = <Tab>[
   Tab(text: 'Chat', icon: Icon(Icons.chat)),
   Tab(text: 'Task', icon: Icon(Icons.work)),
   Tab(text: 'Contacts', icon: Icon(Icons.contacts)),

 ];

 TabController _tabController;

 @override
 void initState() {
   super.initState();
   _tabController = TabController(vsync: this, length: myTabs.length);
 }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          if(tab.text == 'Chat') {
            return Center(child: ConversationPage());
          }else if(tab.text == 'Task'){
            return Center(child: TaskPage());

          }else if(tab.text == 'Contacts'){
            return Center(child: ContactPage());

          }
        }).toList(),
      ),
    );
  }
}