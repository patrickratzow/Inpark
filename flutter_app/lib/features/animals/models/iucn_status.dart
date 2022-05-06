import "package:flutter/material.dart";

import "../../../generated_code/zooinator.enums.swagger.dart";

class IUCNStatus {
  final Color color;
  final Color textColor;
  final String name;
  final String description;

  IUCNStatus({
    required this.color,
    required this.textColor,
    required this.name,
    required this.description,
  });
}

final Map<IUCNStatusDto, IUCNStatus> ucnStatusColorMap = {
  IUCNStatusDto.ex: IUCNStatus(
    color: Colors.black,
    textColor: const Color(0xffC33131),
    name: "Uddød",
    description:
        "Alle forsøg på at finde levende eksemplarer af arten er mislykkedes. Det sidste kendte individ af arten er død efter år 1500. Eksempler er Tasmansk pungulv, moa og dronte.",
  ),
  IUCNStatusDto.ew: IUCNStatus(
    color: const Color(0xff1A1A1A),
    textColor: Colors.white,
    name: "Uddød i vild tilstand",
    description:
        "Der findes individer af arten i fangenskab, eller den kan være genudsat i nye miljøer, men arten er uddød i sit naturlige miljø. Udryddede arter er arter, der stadig findes i vild tilstand, men udenfor deres naturlige område. Et eksempel kunne være Przewalski-hesten.",
  ),
  IUCNStatusDto.cr: IUCNStatus(
    color: const Color(0xffCC3333),
    textColor: const Color(0xffFFCCCC),
    name: "Kritisk truet",
    description:
        "Arten er i ekstremt stor risiko for at uddø nu. Et eksempel kunne være Sort næsehorn.",
  ),
  IUCNStatusDto.en: IUCNStatus(
    color: const Color(0xffCC6633),
    textColor: const Color(0xffFFCC99),
    name: "Truet",
    description:
        "Arten er i meget stor risiko for at uddø i den nærmeste fremtid. Eksempler er blåhval og stor panda.",
  ),
  IUCNStatusDto.vu: IUCNStatus(
    color: const Color(0xffCC9900),
    textColor: const Color(0xffFFFFCC),
    name: "Sårbar",
    description:
        "Der er en stor risiko for at arten uddør i vild tilstand på længere sigt. Et eksempel på en art i denne kategori kunne være den hvide haj.",
  ),
  IUCNStatusDto.nt: IUCNStatus(
    color: const Color(0xff005050),
    textColor: const Color(0xff99CC99),
    name: "Næsten truet",
    description: "Arten er tæt på kvalificering som sårbar.",
  ),
  IUCNStatusDto.lc: IUCNStatus(
    color: const Color(0xff006666),
    textColor: Colors.white,
    name: "Ikke truet",
    description:
        "Almindelige arter samt arter hvor der måske er grund til bekymring, selvom arten ikke i øjeblikket er direkte truet.  Eksempler på dyr i denne kategori kunne være kapivar og spækhuggeren.",
  )
};
