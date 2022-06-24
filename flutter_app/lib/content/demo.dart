import "package:flutter/material.dart";

import "../common/screen.dart";
import '../sdui/content_renderer.dart';
import '../sdui/parser/parser.dart';

class SDUIScreen extends StatelessWidget implements Screen {
  final String input;

  const SDUIScreen({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    final renderer = ContentRenderer();
    final data = ParserData();
    final result = renderer.render(input, context, data);

    return result;
  }
}


/*
<Navbar>
  <Navtab text="Hello" icon="menu">
    <Padding all="8">
      <Column>
        <ConservationStatus status="cr" />

        <Text lang="en">Hello World</Text>
        <Text lang="da">Hej Verden</Text>
        <Container>
          <Text size="32">Ekstra</Text>
        </Container>
      </Column>
    </Padding>
  </Navtab>
  <Navtab text="Foo" icon="menu">
    <Padding all="8">
      <Text size="64" weight="bold">FOOBAR</Text>
    </Padding>
  </Navtab>
</Navbar>*/