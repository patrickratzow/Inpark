import "package:flutter/material.dart";
import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/common/modal_sheet.dart";
import "package:flutter_app/features/settings/ui/setting_row.dart";
import "package:flutter_app/features/settings/ui/settings_title_bar.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../common/screen.dart";
import "../../../common/ui/screen_app_bar.dart";
import "../../../hooks/hooks.dart";
import "../../../services/notification_service.dart";

class NotificationSettingsPage extends HookWidget implements Screen {
  const NotificationSettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    final navigator = useNavigator();
    final notificationService = locator.get<NotificationService>();
    final notificationDuration =
        useFuture(notificationService.getReminderTime());
    final notificationRemindBeforeStart =
        useFuture(notificationService.shouldNotifyShortlyBeforeStart());
    final isLoading = notificationDuration.data == null ||
        notificationRemindBeforeStart.data == null;

    return Scaffold(
      appBar: const ScreenAppBar(
        title: "Notifikationer",
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Column(
              children: [
                const SettingsTitleBar(name: "Speaks"),
                SettingRow(
                  leading: const Icon(
                    Icons.timer,
                    color: Colors.black,
                    size: 16.0,
                  ),
                  name: "Påmindelse varsel",
                  trailing: Text(
                    "${notificationDuration.data!.inMinutes} minutter",
                    style: theme.textTheme.bodyLarge,
                    textScaleFactor: 1.0,
                  ),
                  onPressed: () {
                    showModalSheet(
                      context: context,
                      title: "Påmindelse tid før en speak",
                      builder: (context) {
                        return NotificationReminderTimeModal(
                          selectedDuration: notificationDuration.data!,
                          onSelected: (Duration duration) {
                            notificationService.setReminderTime(duration);

                            navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
                SettingRow(
                  leading: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 16.0,
                  ),
                  name: "Påmind mig igen kort før start",
                  trailing: Switch.adaptive(
                    value: notificationRemindBeforeStart.data!,
                    onChanged: (value) {
                      notificationService
                          .setShouldNotifyShortlyBeforeStart(value);
                    },
                  ),
                  onPressed: () {
                    notificationService.setShouldNotifyShortlyBeforeStart(
                      !notificationRemindBeforeStart.data!,
                    );
                  },
                )
              ],
            ),
    );
  }
}

class NotificationReminderTimeModal extends HookWidget {
  final Duration selectedDuration;
  final void Function(Duration) onSelected;

  NotificationReminderTimeModal({
    required this.selectedDuration,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Column(
      children: [
        _buildNotificationReminderTime(
          selectedDuration,
          const Duration(minutes: 5),
          onSelected,
          theme,
        ),
        _buildNotificationReminderTime(
          selectedDuration,
          const Duration(minutes: 10),
          onSelected,
          theme,
        ),
        _buildNotificationReminderTime(
          selectedDuration,
          const Duration(minutes: 15),
          onSelected,
          theme,
        ),
        _buildNotificationReminderTime(
          selectedDuration,
          const Duration(minutes: 30),
          onSelected,
          theme,
        ),
      ],
    );
  }

  Widget _buildNotificationReminderTime(
    Duration selectedDuration,
    Duration duration,
    void Function(Duration) onSelected,
    ThemeData theme,
  ) {
    final isSelected = selectedDuration == duration;

    return TextButton(
      onPressed: () {
        onSelected(duration);
      },
      child: Row(
        children: [
          Checkbox(
            shape: const CircleBorder(),
            value: isSelected,
            onChanged: (value) {
              onSelected(duration);
            },
          ),
          Text(
            "${duration.inMinutes} minutter",
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
