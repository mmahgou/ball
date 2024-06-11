import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  late SpriteAnimationComponent ball; // Declare the ball

  @override
  Future<void> onLoad() async {
    // Load individual frames from the assets
    final ballFrame1 = await Flame.images.load('ball_1.png');
    final ballFrame2 = await Flame.images.load('ball_2.png');
    final ballFrame3 = await Flame.images.load('ball_3.png');

    // Create sprites from the loaded images
    final ballSprite1 = Sprite(ballFrame1);
    final ballSprite2 = Sprite(ballFrame2);
    final ballSprite3 = Sprite(ballFrame3);

    // Create the animation
    final ballAnimation = SpriteAnimation.spriteList(
      [ballSprite1, ballSprite2, ballSprite3],
      stepTime: 0.3,
    );

    // Initialize the SpriteAnimationComponent with the animation
    ball = SpriteAnimationComponent()
      ..animation = ballAnimation
      ..size = Vector2(64.0, 64.0) //size of the ball
      ..position = Vector2(100.0, 100.0); // Set the initial position of the ball

    // Add the ball component to the game
    add(ball);
  }
}

void main() {
  final myGame = MyGame(); // Create an instance of MyGame
  runApp(GameWidget(game: myGame)); // Run the game within a GameWidget
}
