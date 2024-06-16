import 'package:flutter/material.dart';
import 'package:forgot_your_resume/core/utils/mvp_extensions.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_presentation_view_state.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_view_model.dart';
import 'package:forgot_your_resume/features/meetings/create/create_meeting_initial_params.dart';
import 'package:intl/intl.dart';

class CreateMeetingPage extends StatefulWidget with HasInitialParams {
  const CreateMeetingPage({
    super.key,
    required this.initialParams,
  });

  @override
  final CreateMeetingInitialParams initialParams;

  @override
  State<CreateMeetingPage> createState() => _CreateMeetingPageState();
}

class _CreateMeetingPageState extends State<CreateMeetingPage>
    with ViewModelStateMixinAuto<CreateMeetingViewState, CreateMeetingViewModel, CreateMeetingPage> {
  late final TextEditingController dateTextController;

  @override
  void initState() {
    dateTextController = TextEditingController(
      text: DateFormat(DateFormat.YEAR_MONTH_DAY).format(
        DateTime.now(),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    dateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Название',
                ),
                onChanged: viewModel.onChangeName,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Дата',
                ),
                controller: dateTextController,
                enabled: false,
                onChanged: viewModel.onChangeName,
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: viewModel.onTapCreate,
                child: const Text('Создать'),
              ),
            ],
          ),
        ),
      );
}
