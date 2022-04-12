import "package:flutter/material.dart";

class ConservationStatus extends StatelessWidget {
  const ConservationStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Bevaringsstatus",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff698665),
              fontFamily: "Poppins",
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildExtinctSection(),
            const SizedBox(width: 16),
            _buildThreatenedSection(),
            const SizedBox(width: 16),
            _buildNotThreatenedSection(),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildExtinctSection() {
    return [
      Column(
        children: [
          const ConservationCircle(
            text: "EX",
            color: Colors.black,
            textColor: Color(0xffC33131),
            active: false,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
            child: Container(
              color: const Color(0xff698665),
              child: const SizedBox(
                width: 1,
                height: 10,
              ),
            ),
          ),
          const Text(
            "Uddød",
            style: TextStyle(color: Color(0xff698665)),
          )
        ],
      ),
      const SizedBox(width: 16),
      Column(
        children: const [
          ConservationCircle(
            text: "EW",
            color: Color(0xff1A1A1A),
            textColor: Colors.white,
            active: false,
          ),
        ],
      ),
    ];
  }

  Widget _buildThreatenedSection() {
    return Column(
      children: [
        Row(
          children: const [
            ConservationCircle(
              text: "CR",
              color: Color(0xffCC3333),
              textColor: Color(0xffFFCCCC),
              active: false,
            ),
            SizedBox(width: 16),
            ConservationCircle(
              text: "EN",
              color: Color(0xffCC6633),
              textColor: Color(0xffFFCC99),
              active: false,
            ),
            SizedBox(width: 16),
            ConservationCircle(
              text: "VU",
              color: Color(0xffCC9900),
              textColor: Color(0xffFFFFCC),
              active: false,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 5),
          child: Image.asset("assets/bow_connector.png"),
        ),
        const Text(
          "Truet",
          style: TextStyle(color: Color(0xff698665)),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildNotThreatenedSection() {
    return Column(
      children: [
        const ConservationCircle(
          text: "NT",
          color: Color(0xff006666),
          textColor: Color(0xff99CC99),
          active: true,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
          child: Container(
            color: const Color(0xff698665),
            child: const SizedBox(
              width: 1,
              height: 10,
            ),
          ),
        ),
        const Text(
          "Ikke \nTruet",
          style: TextStyle(color: Color(0xff698665)),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class ConservationCircle extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final bool active;

  const ConservationCircle({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: active ? 1 : 0.25,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            height: 16 / 12,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
