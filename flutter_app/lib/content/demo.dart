import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/iucn_status.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";
import "package:flutter_app/sdui/screen.dart";

import "../common/ioc.dart";
import "../common/screen.dart";
import "../features/animals/models/animal.dart";
import "../sdui/content_renderer.dart";
import "../sdui/parser/parser.dart";

class SDUIScreen extends StatelessWidget implements Screen {
  const SDUIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenManager = locator.get<ScreenManager>();
    final renderer = ContentRenderer();
    final data = ParserData();

    final animal = Animal(
      id: "1",
      displayName: "Lion",
      latinName: "Panthera leo",
      category: "Mammal",
      previewImageUrl:
          "https://cms.aalborgzoo.dk/media/xy4hhjc3/l%C3%B8ve1920x900.jpg",
      fullscreenImageUrl:
          "https://cms.aalborgzoo.dk/media/xy4hhjc3/l%C3%B8ve1920x900.jpg",
      conservationStatus: ucnStatusColorMap[IUCNStatusDto.en],
      description: "",
    );

    final input = """
<AnimalScreen
  :displayName="Lion"
  :latinName="${animal.latinName}"
  :previewImage="${animal.previewImageUrl}"
  :fullscreenImage="${animal.fullscreenImageUrl}"
  :tag="animal-${animal.latinName}"
  :title="${animal.displayName}"
  :category="${animal.category}"
/>
""";
/*
  <AppBar
    title="Hi"
    automatically-imply-leading="false"
  />
  <Body>
    <Container margin="10,10,10,10">
      <Column>
<Button action="navigateToScreen">
  <ActionData><![CDATA[{"routeName":"animal_screen","name":{"displayName":"Hello","latinName":"World"},"category":"Pattedyr","image":{"previewUrl":"https://cms.aalborgzoo.dk/media/cwulavws/dv%C3%A6rgged700x350.jpg","fullscreenUrl":"https://cms.aalborgzoo.dk/media/cwulavws/dv%C3%A6rgged700x350.jpg"},"status":1,"id":"hey","contents":[{"type":"spacer","value":"","children":[]},{"type":"spacer","value":"","children":[]}],"hasMap":false}]]></ActionData>
  <AnimalCard 
    :title= "Afrikansk dværgged"
    :subTitle= "Capra aegagrus hircus"
    :category="Pattedyr"
    :src="https://cms.aalborgzoo.dk/media/cwulavws/dv%C3%A6rgged700x350.jpg"
  />
</Button>
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
*/
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