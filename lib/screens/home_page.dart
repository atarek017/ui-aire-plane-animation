import 'package:flutter/material.dart';
import 'package:ui_aire_plan_chang/price_tab/price_tab.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool showInputTabOptions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(8.0),
          child: DefaultTabController(
            child: new LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return Column(
                  children: <Widget>[
                    _buildContentContainer(viewportConstraints),
                  ],
                );
              },
            ),
            length: 3,
          ),
        ),
      ),
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 48.0,
          ),
          child: new IntrinsicHeight(
            child: PriceTab(
              height: viewportConstraints.maxHeight - 48.0,
              onPlaneFlightStart: () =>
                  setState(() => showInputTabOptions = false),
            ),
          ),
        ),
      ),
    );
  }
}
