import 'package:calendar_app/widgets/calendar.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text("AppBar"),
              pinned: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                child: Calendar(),
              ),
              ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Item $index"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
