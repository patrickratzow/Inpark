import 'package:flutter_app/features/home/models/home_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HomeModel model = HomeModel();

  test(
    'Greet message for 03:00',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 3, 0, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Morgen');
    },
  );
  test(
    'Greet message for 10:59',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 10, 59, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Morgen');
    },
  );

  test(
    'Greet message for 11:00',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 11, 0, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Middag');
    },
  );

  test(
    'Greet message for 13:59',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 13, 59, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Middag');
    },
  );

  test(
    'Greet message for 14:00',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 14, 0, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Eftermiddag');
    },
  );

  test(
    'Greet message for 16:59',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 16, 59, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Eftermiddag');
    },
  );

  test(
    'Greet message for 17:00',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 17, 0, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Aften');
    },
  );

  test(
    'Greet message for 02:59',
    () {
      // Arrange
      DateTime testTime = DateTime(2022, 1, 1, 2, 59, 0, 0, 0);

      // Act
      var result = model.greetingText(dateTime: testTime);

      // Assert
      expect(result, 'God Aften');
    },
  );
}
