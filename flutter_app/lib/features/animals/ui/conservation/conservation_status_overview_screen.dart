import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/ui/screen_app_bar.dart';
import 'package:flutter_app/common/ui/title_bar.dart';
import 'package:flutter_app/features/animals/models/iucn_status.dart';
import 'package:flutter_app/features/animals/ui/conservation/conservation_status.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class ConservationStatusOverviewScreen extends StatelessWidget {
  final IUCNStatusDto? highlightedStatus;

  const ConservationStatusOverviewScreen({
    Key? key,
    this.highlightedStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(name: "Bevaringsstatuser"),
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

class ConservationStatusExplainationRow extends StatelessWidget {
  final IUCNStatusDto status;
  final bool highlight;

  const ConservationStatusExplainationRow({
    Key? key,
    required this.status,
    required this.highlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusColor = ucnStatusColorMap[status]!;

    return Container(
      color:
          highlight ? statusColor.color.withOpacity(0.25) : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: ConservationCircle(
                      text: status.name.toUpperCase(),
                      color: statusColor.color,
                      textColor: statusColor.textColor,
                      active: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusColor.name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          statusColor.description,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
