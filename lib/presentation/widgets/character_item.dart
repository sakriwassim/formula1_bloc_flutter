import 'package:block_breakingbad_flutter/constants/strings.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
import '../../size_config.dart';
import 'circle_image.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //horizontal: getProportionateScreenHeight(5),
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(5),
          vertical: getProportionateScreenWidth(10)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: getProportionateScreenHeight(80),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, characterDetailScreens,
                arguments: character),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: CircleImage(
                      height: 60,
                      image: character.imageUrl.toString(),
                      // "assets/images/playerimages/Carlos Sainz.jpg",
                      //character.imageUrl.toString(),
                      width: 60,
                    ),
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    // height: 150,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10)),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              character.fullName.toString(),
                            ),
                            Text(
                              character.title.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
