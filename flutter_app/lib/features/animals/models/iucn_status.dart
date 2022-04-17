import 'package:flutter/material.dart';

import '../../../generated_code/zooinator.enums.swagger.dart';

class IUCNColorStatus {
  final Color color;
  final Color textColor;

  // ignore: require_trailing_commas
  IUCNColorStatus({required this.color, required this.textColor});
}

final Map<IUCNStatusDto, IUCNColorStatus> ucnStatusColorMap = {
  IUCNStatusDto.ex:
      IUCNColorStatus(color: Colors.black, textColor: const Color(0xffC33131)),
  IUCNStatusDto.ew:
      IUCNColorStatus(color: const Color(0xff1A1A1A), textColor: Colors.white),
  IUCNStatusDto.cr: IUCNColorStatus(
      color: const Color(0xffCC3333), textColor: const Color(0xffFFCCCC)),
  IUCNStatusDto.en: IUCNColorStatus(
      color: const Color(0xffCC6633), textColor: const Color(0xffFFCC99)),
  IUCNStatusDto.vu: IUCNColorStatus(
      color: const Color(0xffCC9900), textColor: const Color(0xffFFFFCC)),
  IUCNStatusDto.nt: IUCNColorStatus(
      color: const Color(0xff005050), textColor: const Color(0xff99CC99)),
  IUCNStatusDto.lc:
      IUCNColorStatus(color: const Color(0xff006666), textColor: Colors.white)
};
