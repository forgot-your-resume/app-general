import 'package:forgot_your_resume/core/utils/future_result.dart';
import 'package:forgot_your_resume/features/meetings/domain/models/conference.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class MeetingsListPresentationViewState implements MeetingsListViewState {
  /// Creates the initial state
  MeetingsListPresentationViewState.initial(
    // ignore: avoid_unused_constructor_parameters
    MeetingsListInitialParams initialParams,
  )   : conferences = const [],
        loadingResult = const FutureResult.empty(),
        creatingResult = const FutureResult.empty();

  /// Used for the copyWith method
  MeetingsListPresentationViewState._({
    required this.conferences,
    required this.loadingResult,
    required this.creatingResult,
  });

  final FutureResult loadingResult;
  final FutureResult creatingResult;

  @override
  final List<Conference> conferences;

  @override
  bool get isLoading => loadingResult.isPending();

  @override
  bool get isCreatingConference => creatingResult.isPending();

  MeetingsListPresentationViewState copyWith({
    List<Conference>? conferences,
    FutureResult? loadingResult,
    FutureResult? creatingResult,
  }) {
    return MeetingsListPresentationViewState._(
      conferences: conferences ?? this.conferences,
      loadingResult: loadingResult ?? this.loadingResult,
      creatingResult: creatingResult ?? this.creatingResult,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class MeetingsListViewState {
  bool get isLoading;
  bool get isCreatingConference;
  List<Conference> get conferences;
}
