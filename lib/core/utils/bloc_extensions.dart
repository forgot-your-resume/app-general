import 'dart:async';

import 'package:forgot_your_resume/core/utils/future_result.dart';
import 'package:forgot_your_resume/core/utils/stream_result.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot_your_resume/core/utils/either_extensions.dart';

extension BlocExtensions<T> on BlocBase<T> {
  void safeEmit(T state) {
    if (!isClosed) {
      // ignore: ban-name, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      emit(state);
    }
  }
}

extension AsObservableFuture<T> on Future<T> {
  Future<T> observeStatusChanges(void Function(FutureResult<T>) onChange) {
    onChange(
      //ignore: prefer-trailing-comma
      const FutureResult(null, FutureStatus.pending, null),
    );

    return then((value) {
      onChange(
        //ignore: prefer-trailing-comma
        FutureResult(value, FutureStatus.fulfilled, null),
      );

      return value;
    }).catchError((error) {
      onChange(
        //ignore: prefer-trailing-comma
        FutureResult(null, FutureStatus.rejected, error),
      );

      throw error as Object;
    });
  }
}

extension AsObservableStream<T> on Stream<T> {
  void observeStatusChanges({
    void Function(StreamResult<T>)? onStatusChange,
    void Function(T)? onEmit,
    required void Function(StreamSubscription<T>) onSubscribed,
  }) {
    // subscription should be handled in `onSubscribed` and properly disposed on call site.
    //ignore: cancel_subscriptions
    final subscription = listen(
      (value) {
        onStatusChange?.call(
          //ignore: prefer-trailing-comma
          StreamResult(value, StreamStatus.emission, null),
        );
        onEmit?.call(value);
      },
      onError: (error) {
        onStatusChange?.call(
          //ignore: prefer-trailing-comma
          StreamResult(null, StreamStatus.rejected, error),
        );

        throw error as Object;
      },
      onDone: () {
        onStatusChange?.call(
          //ignore: prefer-trailing-comma
          const StreamResult(null, StreamStatus.finished, null),
        );
      },
    );
    onSubscribed(subscription);
    onStatusChange?.call(
      //ignore: prefer-trailing-comma
      const StreamResult(null, StreamStatus.pendingFirstEmission, null),
    );
  }
}

extension EitherResultExtensions<L, R> on FutureResult<Either<L, R>> {
  R? getSuccess() => result?.getSuccess();

  L? getFailure() => result?.getFailure();

  FutureResult<Either<L, R2>> mapSuccess<R2>(R2 Function(R) mapper) => //
      mapResult((result) => result?.map(mapper));
}
