import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class CreateMeetingPresentationViewState implements CreateMeetingViewState {
  /// Creates the initial state
  CreateMeetingPresentationViewState.initial(
    // ignore: avoid_unused_constructor_parameters
    CreateMeetingInitialParams initialParams,
  ) : name = '';

  /// Used for the copyWith method
  CreateMeetingPresentationViewState._({
    required this.name,
  });

  final String name;

  CreateMeetingPresentationViewState copyWith({
    String? name,
  }) {
    return CreateMeetingPresentationViewState._(
      name: name ?? this.name,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class CreateMeetingViewState {}
