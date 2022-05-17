import "package:flutter/material.dart";
import "../../../../common/screen.dart";
import "../../../../common/ui/screen_app_bar.dart";
import "../../../../generated_code/zooinator.swagger.dart";

import "conservation_status_explaination_row.dart";

class ConservationStatusOverviewScreen extends StatelessWidget
    implements Screen {
  final IUCNStatusDto? highlightedStatus;

  const ConservationStatusOverviewScreen({
    Key? key,
    this.highlightedStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(title: "Bevaringsstatuser"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: [
              _buildRow(IUCNStatusDto.lc),
              _buildRow(IUCNStatusDto.nt),
              _buildRow(IUCNStatusDto.vu),
              _buildRow(IUCNStatusDto.en),
              _buildRow(IUCNStatusDto.cr),
              _buildRow(IUCNStatusDto.ew),
              _buildRow(IUCNStatusDto.ex),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(IUCNStatusDto status) {
    final isActive = status == highlightedStatus;
    final key = GlobalKey();
    final row = Padding(
      key: key,
      padding: const EdgeInsets.only(top: 16),
      child: ConservationStatusExplainationRow(
        status: status,
        highlight: isActive,
      ),
    );

    if (isActive) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (key.currentContext == null) return;

        Scrollable.ensureVisible(key.currentContext!);
      });
    }

    return row;
  }
}
