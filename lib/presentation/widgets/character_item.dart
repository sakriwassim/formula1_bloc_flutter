import 'package:block_breakingbad_flutter/constants/strings.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailScreens,
            arguments: character),
        child: GridTile(
          // ignore: sort_child_properties_last
          child: character.image!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  image: '${character.imageUrl}',
                  fit: BoxFit.cover,
                )
              : CircularProgressIndicator(),

          footer: Hero(
            tag: character.id!,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.fullName}',
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
