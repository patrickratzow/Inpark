import "package:flutter/material.dart";
import "package:flutter_app/sdui/screen.dart";
import "package:flutter_app/sdui/transformers/component.dart";

import "../common/ioc.dart";
import "../common/screen.dart";
import "../sdui/content_renderer.dart";
import "../sdui/parser/parser.dart";

class SDUIScreen extends StatelessWidget implements Screen {
  const SDUIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenManager = locator.get<ScreenManager>();
    final renderer = ContentRenderer();
    final data = ParserData();
    screenManager.registerScreen(
      "foo",
      """
<Scaffold>
  <AppBar
    title="Foo screen"
  />
  <Body>
    <Container margin="10,10,10,10">
      <Text>Foo</Text>
    </Container>
  </Body>
</Scaffold>
""",
    );
    ComponentTransformer.registerComponent(
      "AnimalCard",
      """
<AspectRatio ratio="2.4676">
  <Card border-radius="circular(6)" clip="antiAlias">
    <Stack>
      <Positioned fill="true">
        <Image
          fit="cover"
          src="\${{ src }}"
          blend-mode="darken"
        />
      </Positioned> 
      <Positioned fill="true">
        <Row>
          <Expanded>
            <Container>
              <Decoration>
                <LinearGradient begin="topCenter" end="bottomCenter">
                  <Color>#87000000</Color>
                  <Color>#00000000</Color>
                </LinearGradient>
              </Decoration>
            </Container>
          </Expanded>
        </Row>
      </Positioned>
      <Positioned fill="true">
        <Padding all="8">
          <Column main-axis-alignment="spaceBetween" main-axis-size="max">
            <Column>
              <Align alignment="centerLeft">
                <Text 
                  color="#ffffffff" 
                  style="headlineMedium" 
                  weight="bold"
                >
                  \${{ title }}
                </Text>
              </Align>
              <Align alignment="centerLeft">
                <Text 
                  color="#ffffffff" 
                  style="bodyMedium" 
                  weight="w500"
                  height="1.5"
                >
                  \${{ subTitle }}
                </Text>
              </Align>
            </Column>
            <Row>
              <Container padding="6,4,6,4">
                <Decoration border-radius="circular(4)">
                  <Color>#FFECFCE5</Color>
                </Decoration>
                <Text style="bodyLarge" color="#FF198155" size="8" height="0.9375">
                  \${{ category }}
                </Text>
              </Container>
            </Row>
          </Column>
        </Padding>
      </Positioned>
    </Stack>
  </Card>
</AspectRatio>
""",
    );
    const input = """
<Scaffold>
  <AppBar
    title="Hi"
    automatically-imply-leading="false"
  />
  <Body>
    <Container margin="10,10,10,10">
      <Column>
        <AnimalCard 
          :title= "Afrikansk dværgged"
          :subTitle= "Capra aegagrus hircus"
          :category="Pattedyr"
          :src="https://cms.aalborgzoo.dk/media/cwulavws/dv%C3%A6rgged700x350.jpg"
        />
        <Container height="8" />
        <AnimalCard 
          :title= "Afrikansk elefant"
          :subTitle= "Loxodonta africana"
          :category="Pattedyr"
          :src="https://cms.aalborgzoo.dk/media/ftadnpvt/elefant700x350.jpg"
        />
      </Column>
    </Container>
  </Body>
</Scaffold>
""";
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