import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_app/log_in/models/user_model.dart";
import "package:flutter_app/log_in/services/apple_authentication_provider.dart";
import "package:flutter_app/log_in/services/facebook_authentication_provider.dart";
import "package:flutter_app/navigation/navigation_model.dart";
import "package:flutter_app/services/capability_service.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../services/google_authentication_provider.dart";

class LoginPage extends HookWidget implements Screen {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    final navigator = useNavigator();
    final userModel = useProvider<UserModel>(watch: true);
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;
    final capabilities = useCapabilities();

    return Scaffold(
      appBar: const ScreenAppBar(
        title: "Log in",
      ),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          Positioned(
            top: MediaQuery.of(context).size.height / 9,
            left: MediaQuery.of(context).size.width / 5,
            child: Image.asset(
              "assets/logo.png",
              height: 100,
            ),
          ),
          Positioned(
            left: 32,
            top: MediaQuery.of(context).size.height / 4,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildButtons(
            bottomViewPadding,
            userModel,
            navigator,
            context,
            capabilities,
          )
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      child: CachedNetworkImage(
        imageUrl:
            "https://cms.aalborgzoo.dk/media/j0ej4iqh/fest-i-vilde-omgivelser-700x350.jpg?width=592",
        imageBuilder: ((context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.3,
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildButtons(
    double bottomViewPadding,
    UserModel userModel,
    NavigationModel navigator,
    BuildContext context,
    CapabilityService capability,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _signInButton(
          bottomViewPadding,
          () async => {
            await userModel.signIn(GoogleAuthenticationProvider()),
            navigator.pop(context)
          },
          "Continue with Google",
          Colors.white,
          "Google.svg",
        ),
        _signInButton(
          bottomViewPadding,
          () async => {
            await userModel.signIn(FacebookAuthenticationProvider()),
            navigator.pop(context)
          },
          "Continue with Facebook",
          Colors.blue,
          "Facebook.svg",
        ),
        capability.allowAppleLogin
            ? _signInButton(
                bottomViewPadding,
                () async => {
                  await userModel.signIn(AppleAuthenticationProvider()),
                  navigator.pop(context)
                },
                "Continue with Apple",
                Colors.black,
                "apple.svg",
              )
            : Container(),
      ],
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: CachedNetworkImage(
              imageUrl:
                  "https://cms.aalborgzoo.dk/media/j0ej4iqh/fest-i-vilde-omgivelser-700x350.jpg?width=592",
              imageBuilder: ((context, imageProvider) => Container(
                    width: 343,
                    height: 248,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/aalborg_zoo.svg"),
            ],
          )
        ],
      ),
    );
  }

  Widget _signInButton(
    double bottomViewPadding,
    VoidCallback onPressed,
    String text,
    Color color,
    String path,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 4.0,
        left: 24,
        right: 24,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/" + path,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: color == Colors.white ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }
}
