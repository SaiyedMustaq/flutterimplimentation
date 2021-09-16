import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenLifecycle extends StatefulWidget {
  ScreenLifecycleState state;

  //createState(): When the Framework is instructed to build a StatefulWidget, it immediately calls createState()
  @override
  State<StatefulWidget> createState() {
    return ScreenLifecycleState();
  }
}

class ScreenLifecycleState extends State<ScreenLifecycle> {
  bool _switch;
  /*
    mounted is true: When createState creates your state class, a buildContext is assigned to that state.
    BuildContext is, overly simplified, the place in the widget tree in which this widget is placed.
    Here's a longer explanation. All widgets have a bool this.mounted property.
    It is turned true when the buildContext is assigned. It is an error to call setState when a widget is unmounted.
    mounted is false: The state object can never remount, and an error is thrown is setState is called.
    */

  /*
    This is the first method called when the widget is created (after the class constructor, of course.)
    initState is called once and only once. It must called super.initState().
    */
  @override
  void initState() {
    super.initState();
    print("initState $_switch");
  }

  /*
    This method is called immediately after initState on the first time the widget is built.
    */
  @override
  void didChangeDependencies() {
    _switch = false;
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  /*
    build(): This method is called often. It is required, and it must return a Widget.
    */
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Switch(value: _switch, onChanged: (value) => onSwitchChange(value))
          ],
        ),
      ),
    );
  }

  /*
                If the parent widget changes and has to rebuild this widget (because it needs to give it different data),
                but it's being rebuilt with the same runtimeType, then this method is called.
                This is because Flutter is re-using the state, which is long lived.
                In this case, you may want to initialize some data again, as you would in initState.
                */
  @override
  void didUpdateWidget(ScreenLifecycle oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void setState(fn) {
    print("setState");
    super.setState(fn);
  }

  /*
                Deactivate is called when State is removed from the tree,
                but it might be reinserted before the current frame change is finished.
                This method exists basically because State objects can be moved from one point in a tree to another.
                */
  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  /*
                Dispose is called when the State object is removed, which is permanent.
                This method is where you should unsubscribe and cancel all animations, streams, etc.
                */
  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('\n\ndidChangeAppLifecycleState');
    switch (state) {
      case AppLifecycleState.resumed:
        print('\n\nresumed');

        break;
      case AppLifecycleState.inactive:
        print('\n\ninactive');
        break;
      case AppLifecycleState.paused:
        print('\n\npaused');
        break;
      case AppLifecycleState.detached:
        print('\n\ndetached');
        break;
    }
  }

  onSwitchChange([bool value]) {
    _switch = value;
    setState(() {});
  }
}
