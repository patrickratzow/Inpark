import "package:flutter/material.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

import "conservation_status_explaination_row.dart";

class ConservationStatusOverviewScreen extends StatelessWidget {
  final IUCNStatusDto? highlightedStatus;

  const ConservationStatusOverviewScreen({
    Key? key,
    this.highlightedStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(title: "Bevaringsstatuser"),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          _buildRow(IUCNStatusDto.lc),
          _buildRow(IUCNStatusDto.nt),
          _buildRow(IUCNStatusDto.vu),
          _buildRow(IUCNStatusDto.en),
          _buildRow(IUCNStatusDto.cr),
          _buildRow(IUCNStatusDto.ew),
          _buildRow(IUCNStatusDto.ex),
        ],
      ),
    );
  }

  ConservationStatusExplainationRow _buildRow(IUCNStatusDto status) {
    final isActive = status == highlightedStatus;

    return ConservationStatusExplainationRow(
      status: status,
      highlight: isActive,
    );
  }
}
