import "package:flutter/material.dart";
import "package:zooinator_content_rendering/content_renderer.dart";
import "package:zooinator_content_rendering/parser/parser.dart";

class ContentDemo extends StatelessWidget {
  const ContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final input = """
<Scaffold>
  <AppBar>
    <title>Content Rendering Demo</title>
    <automatically-imply-leading>true</automatically-imply-leading>
  </AppBar>
  <Body>
    <Container width="max" height="max">
      <Center>
        <LargeText />
      </Center>
    </Container>
  </Body>
</Scaffold>
""";
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