import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetest/common/hex_color.dart';
import 'package:machinetest/model/HomeModel.dart';
import 'package:machinetest/widgets/common_fade_in_image.dart';
import 'package:machinetest/common/font_style.dart';


class HomeCategoryTile extends StatefulWidget {
  List<Value>? categoryList;

  HomeCategoryTile({Key? key, this.categoryList}) : super(key: key);

  @override
  _HomeCategoryTileState createState() => _HomeCategoryTileState();
}

class _HomeCategoryTileState extends State<HomeCategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 125,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, _index) => GestureDetector(
                onTap: () {
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 4,
                      left: _index == 0 ? 4.0 : 12.0,
                      right: _index + 1 == widget.categoryList!.length
                          ? 4.0
                          : 0.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: HexColor(
                                  '#FAE7E7'),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                            ),
                            width: 60,
                            height: 60,
                          ),
                          CustomFadeImage(
                            url: '${widget.categoryList![_index].imageUrl}',
                            width: 45,
                            height: 45,
                            boxFit: BoxFit.contain,
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: 73,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            '${widget.categoryList![_index].name}',
                            maxLines: _maxLine(
                                '${widget.categoryList![_index].name}'),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: FontStyle.homeCategoryTitle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          itemCount: widget.categoryList!.length),
    );
  }

  int _maxLine(String title) {
    int val = 2;
    if (!title.trim().contains(' ')) {
      val = 1;
    }
    return val;
  }
}
