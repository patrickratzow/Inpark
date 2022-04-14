import 'package:flutter/material.dart';

class IUCNColorStatus {
  final Color color;
  final Color textColor;

  // ignore: require_trailing_commas
  IUCNColorStatus({required this.color, required this.textColor});
}

enum IUCNStatus { EX, EW, CR, EN, VU, NT, LC }

final Map<IUCNStatus, IUCNColorStatus> ucnStatusColorMap = {
  IUCNStatus.EX:
      IUCNColorStatus(color: Colors.black, textColor: const Color(0xffC33131)),
  IUCNStatus.EW:
      IUCNColorStatus(color: const Color(0xff1A1A1A), textColor: Colors.white),
  IUCNStatus.CR: IUCNColorStatus(
      color: const Color(0xffCC3333), textColor: const Color(0xffFFCCCC)),
  IUCNStatus.EN: IUCNColorStatus(
      color: const Color(0xffCC6633), textColor: const Color(0xffFFCC99)),
  IUCNStatus.VU: IUCNColorStatus(
      color: const Color(0xffCC9900), textColor: const Color(0xffFFFFCC)),
  IUCNStatus.NT: IUCNColorStatus(
      color: const Color(0xff005050), textColor: const Color(0xff99CC99)),
  IUCNStatus.LC:
      IUCNColorStatus(color: const Color(0xff006666), textColor: Colors.white)
};
