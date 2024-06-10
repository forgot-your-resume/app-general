// ignore_for_file: cancel_subscriptions

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';

//ignore:prefer-match-file-name
mixin ViewModelStateMixin<M, P extends Cubit<M>, T extends HasViewModel<P>> on State<T> {
  P get viewModel => widget.viewModel;

  M get state => viewModel.state;

  bool disposeViewModel = true;

  Widget stateObserver({
    required BlocWidgetBuilder<M> builder,
    BlocBuilderCondition<M>? buildWhen,
  }) {
    return BlocBuilder<P, M>(
      bloc: viewModel,
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  Widget stateListener({
    required BlocWidgetListener<M> listener,
    BlocListenerCondition<M>? listenWhen,
    Widget? child,
  }) {
    return BlocListener<P, M>(
      bloc: viewModel,
      listener: listener,
      listenWhen: listenWhen,
      child: child,
    );
  }

  Widget stateConsumer({
    required BlocWidgetListener<M> listener,
    required BlocWidgetBuilder<M> builder,
    BlocListenerCondition<M>? listenWhen,
    BlocBuilderCondition<M>? buildWhen,
  }) {
    return BlocConsumer<P, M>(
      bloc: viewModel,
      listener: listener,
      listenWhen: listenWhen,
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (disposeViewModel) {
      viewModel.close();
    }
  }
}

mixin HasViewModel<P> on StatefulWidget {
  P get viewModel;
}

mixin ViewModelStateMixinAuto<M, P extends Cubit<M>, T extends HasInitialParams> on State<T> {
  late final P viewModel = getIt(param1: widget.initialParams);

  M get state => viewModel.state;

  bool disposeViewModel = true;

  Widget stateObserver({
    required BlocWidgetBuilder<M> builder,
    BlocBuilderCondition<M>? buildWhen,
  }) {
    return BlocBuilder<P, M>(
      bloc: viewModel,
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  Widget stateListener({
    required BlocWidgetListener<M> listener,
    BlocListenerCondition<M>? listenWhen,
    Widget? child,
  }) {
    return BlocListener<P, M>(
      bloc: viewModel,
      listener: listener,
      listenWhen: listenWhen,
      child: child,
    );
  }

  Widget stateConsumer({
    required BlocWidgetListener<M> listener,
    required BlocWidgetBuilder<M> builder,
    BlocListenerCondition<M>? listenWhen,
    BlocBuilderCondition<M>? buildWhen,
  }) {
    return BlocConsumer<P, M>(
      bloc: viewModel,
      listener: listener,
      listenWhen: listenWhen,
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (disposeViewModel) {
      viewModel.close();
    }
  }
}

mixin HasInitialParams on StatefulWidget {
  dynamic get initialParams;
}

mixin SubscriptionsMixin<T> on Cubit<T> {
  final _subscriptions = <String, StreamSubscription<dynamic>>{};

  /// To avoid start listening the same stream twice we have to provide unique [subscriptionId]
  void listenTo<C>({
    required Stream<C> stream,
    required String subscriptionId,
    required void Function(C) onChange,
  }) {
    if (!_subscriptions.containsKey(subscriptionId) && !isClosed) {
      final subscription = stream.listen(onChange);
      addSubscription(subscriptionId, subscription);
    }
  }

  void addSubscription(String id, StreamSubscription<dynamic> subscription) {
    _subscriptions[id]?.cancel();
    _subscriptions[id] = subscription;
  }

  ///Cancel and close single subscriptions
  Future<void> closeSubscription(String subscriptionId) async {
    final subscription = _subscriptions[subscriptionId];
    if (subscription != null) {
      await subscription.cancel();
      _subscriptions.remove(subscriptionId);
    }
  }

  ///Cancel and close all subscriptions
  @override
  Future<void> close() async {
    await Future.wait(_subscriptions.values.map((it) => it.cancel()));
    await super.close();
    _subscriptions.clear();
  }
}
