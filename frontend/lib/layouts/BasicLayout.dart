import 'package:flutter/material.dart';

class BasicLayout extends StatefulWidget {
  final List<Widget> childrens;
  final Color backgroundColor;

  const BasicLayout({
    Key? key,
    required this.childrens,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  State<BasicLayout> createState() => _BasicLayoutState();
}

class _BasicLayoutState extends State<BasicLayout> {
  Future<void> _refresh() {
    return Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: double.infinity,
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: widget.childrens.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: widget.childrens[index],
                ),
          ),
        ),
      ),
    );
  }
}
