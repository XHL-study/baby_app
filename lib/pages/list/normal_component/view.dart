import 'package:baby_app/pages/list/normal_component/action.dart';
import 'package:baby_app/pages/list/normal_component/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget buildView(NormalComponentState state, Dispatch dispatch, ViewService viewService) {
  return Material(
    color: Colors.white,
    child: InkWell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: .45, color: state.themeColor, style: BorderStyle.solid)),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  state.icon,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      state.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: state.themeColor),
                    ),
                    Container(
                      child: Text(
                        state.introduction,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      onTap: () {},
      onLongPress: () {
        dispatch(NormalComponentActionCreator.onRemoveItem(state.id));
      },
    ),
  );
}
