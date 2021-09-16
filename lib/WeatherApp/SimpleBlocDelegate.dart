import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate {
  @override
  onTransition(Transition transition) {
    print(transition);
  }
}
