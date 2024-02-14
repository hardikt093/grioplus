import 'package:flutter/material.dart';

import '../../bloc/base/base_state.dart';
import '../widgets/error_widget.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget(
      {required this.state,
      super.key,
      required this.loadedWidget,
      required this.defaultWidget});

  final BaseState state;
  final Widget loadedWidget;
  final Widget defaultWidget;

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state is BaseLoadedState) {
      return widget.loadedWidget;
    } else if (widget.state is BaseErrorState) {
      return ErrorStateWidget(
          errorString: (widget.state is BaseErrorState)
              ? widget.state.props.first.toString()
              : "Error");
    }
    return widget.defaultWidget;
  }
}
