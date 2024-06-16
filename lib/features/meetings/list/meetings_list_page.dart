import 'package:flutter/material.dart';
import 'package:forgot_your_resume/core/utils/mvp_extensions.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_view_model.dart';
import 'package:forgot_your_resume/features/meetings/list/meetings_list_initial_params.dart';
import 'package:forgot_your_resume/uikit/conferences/ui_conferences.dart';
import 'package:forgot_your_resume/uikit/progress_indicator.dart';

class MeetingsListPage extends StatefulWidget with HasInitialParams {
  const MeetingsListPage({
    super.key,
    required this.initialParams,
  });

  @override
  final MeetingsListInitialParams initialParams;

  @override
  State<MeetingsListPage> createState() => _MeetingsListPageState();
}

class _MeetingsListPageState extends State<MeetingsListPage>
    with ViewModelStateMixinAuto<MeetingsListViewState, MeetingsListViewModel, MeetingsListPage> {
  @override
  void initState() {
    viewModel.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('План-график встреч'),
          actions: [
            TextButton.icon(
              onPressed: viewModel.onTapSignOut,
              label: const Icon(Icons.logout),
            )
          ],
        ),
        body: stateObserver(
          builder: (context, state) => state.isLoading
              ? const Center(
                  child: LoadingIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20) + const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: state.isCreatingConference ? null : viewModel.onTapCreateMeeting,
                        child: state.isCreatingConference ? const LoadingIndicator() : const Text('Создать интервью'),
                      ),
                      Expanded(
                        child: UiConferences(
                          conferences: state.conferences,
                          onTap: viewModel.onTapConference,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );
}
