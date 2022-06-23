import "package:flutter/material.dart";
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

  IUCNStatusDto getStatus(NodeElement element) {
    final status = element.getAttribute("status")?.value;
    if (status == "ex") return IUCNStatusDto.ex;
    if (status == "ew") return IUCNStatusDto.ew;
    if (status == "cr") return IUCNStatusDto.cr;
    if (status == "en") return IUCNStatusDto.en;
    if (status == "vu") return IUCNStatusDto.vu;
    if (status == "nt") return IUCNStatusDto.nt;
    if (status == "lc") return IUCNStatusDto.lc;

    return IUCNStatusDto.unknown;
  }

  bool getShowOverview(NodeElement element) =>
      element.getAttribute("showOverview")?.value != "false";
}
