import 'package:flutter/cupertino.dart';

class ContractRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  ContractRoute({
    super.settings,
    required this.builder,
    super.fullscreenDialog = false,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder.call(context);
  }

  @override
  final Color? barrierColor = null;

  @override
  final String? barrierLabel = null;

  @override
  final bool maintainState = true;

  @override
  final Duration transitionDuration = const Duration(milliseconds: 335);
}

class ContractIosRoute<T> extends CupertinoPageRoute<T> {
  ContractIosRoute({
    super.settings,
    required super.builder,
    super.fullscreenDialog = false,
  });

  @override
  final Duration transitionDuration = const Duration(milliseconds: 300);
}

//没有动画的跳转
class NoAnimationContractIosRoute<T> extends CupertinoPageRoute<T> {
  NoAnimationContractIosRoute({
    super.settings,
    required super.builder,
    super.fullscreenDialog = false,
  });

  @override
  final Duration transitionDuration = const Duration(milliseconds: 0);
}

class NoAnimationContractRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  NoAnimationContractRoute({
    super.settings,
    required this.builder,
    super.fullscreenDialog = false,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder.call(context);
  }

  @override
  final Color? barrierColor = null;
  @override
  final String? barrierLabel = null;
  @override
  final bool maintainState = true;
  @override
  final Duration transitionDuration = const Duration(milliseconds: 0);
}
