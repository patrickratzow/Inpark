import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/iucn_status.dart";
import "package:flutter_app/features/animals/ui/conservation/conservation_status.dart";

import "../features/animals/ui/conservation/conservation_status_overview_screen.dart";
import "../generated_code/zooinator.enums.swagger.dart";
import "../hooks/hooks.dart";
import "../sdui/elements/node_element.dart";
import "../sdui/transformers/transformer.dart";
import "pre/hook_transformer.dart";

class ConservationStatusTransformer extends Transformer
    implements HookTransformer {
  @override
  bool shouldTransform(NodeElement element) =>
      element.name == "ConservationStatus";

  @override
  Widget transform(NodeElement element, BuildContext context) {
    final navigator = useNavigator();
    final status = getStatus(element);
    final showOverview = getShowOverview(element);
    if (status == IUCNStatusDto.unknown) return Container();

    Widget widget = ConservationStatus(
      activeStatus: status,
    );
    if (showOverview) {
      widget = InkWell(
        onTap: () => navigator.push(
          context,
          ConservationStatusOverviewScreen(
            highlightedStatus: status,
          ),
        ),
        child: widget,
      );
    }

    return widget;
  }

  IUCNStatus? getStatus(NodeElement element) {
    final status = element.getAttribute("status")?.value;
    if (status == "ex") return ucnStatusColorMap[IUCNStatusDto.ex]!;
    if (status == "ew") return ucnStatusColorMap[IUCNStatusDto.ew]!;
    if (status == "cr") return ucnStatusColorMap[IUCNStatusDto.cr]!;
    if (status == "en") return ucnStatusColorMap[IUCNStatusDto.en]!;
    if (status == "vu") return ucnStatusColorMap[IUCNStatusDto.vu]!;
    if (status == "nt") return ucnStatusColorMap[IUCNStatusDto.nt]!;
    if (status == "lc") return ucnStatusColorMap[IUCNStatusDto.lc]!;

    return null;
  }

  bool getShowOverview(NodeElement element) =>
      element.getAttribute("showOverview")?.value != "false";
}
