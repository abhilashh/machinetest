import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machinetest/common/hex_color.dart';
import 'package:provider/provider.dart';
import 'package:machinetest/common/font_style.dart';

class SearchBar extends StatelessWidget {
  final bool isListening;
  final bool appBarElevation;
  final bool needBoxDecoration;
  final bool needPadding;
  final bool navBack;
  final double? height;
  final bool wrapWithAppBar;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Function()? onClearTap;
  final Function()? onVoiceListen;
  final TextEditingController? searchController;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onEditingComplete;
  final bool onMicTap;
  final double navLeftMargin;

  SearchBar(
      {Key? key,
      this.isListening = false,
      this.appBarElevation = true,
      this.needBoxDecoration = true,
      this.focusNode,
        this.height,
      this.needPadding = true,
      this.navBack = false,
      this.wrapWithAppBar = true,
      this.isReadOnly = false,
      this.onTap,
      this.onClearTap,
      this.searchController,
      this.onTextChanged,
      this.textInputAction,
      this.onVoiceListen,
      this.onEditingComplete,
      this.navLeftMargin = 0.0,
      this.onMicTap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textController = searchController?.text ?? "";
    return wrapWithAppBar
        ? AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle:Platform.isIOS? SystemUiOverlayStyle.dark:
        const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark),
        automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            elevation: appBarElevation ? 0.8 : 0.0,
            shadowColor: appBarElevation ? HexColor('#C7C7CC') : null,
            title: _searchField(context, textController))
        : _searchField(context, textController);
  }

  Widget _searchField(BuildContext context, String textController) {
    return Container(
      margin: needPadding ? EdgeInsets.fromLTRB(12, 1, 12, 0) : const EdgeInsets.all(0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          navBack
              ? InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: navLeftMargin > 0.0
                        ? EdgeInsets.only(left: 10)
                        : const EdgeInsets.all(0.0),
                    padding: EdgeInsets.only(right: 10),
                    height: 40,
                    width: 35,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back,
                      color: HexColor('#1B1B1B'),
                      size: 25,
                    ),
                  ))
              : const SizedBox(),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: height ?? 45,
              decoration: needBoxDecoration
                  ? BoxDecoration(
                      color: HexColor("#FAFAFA"),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: HexColor("#C5C5C5")))
                  : null,
              alignment: Alignment.center,
              child: LayoutBuilder(builder: (context, constraints) {
                double _height = constraints.maxHeight;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          'assets/image/search.png',
                          height: _height * 0.5,
                          width: _height * 0.5,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                            controller: searchController,
                            readOnly: isReadOnly,
                            onTap: onTap,
                            autofocus: true,
                            focusNode: focusNode,
                            onEditingComplete: onEditingComplete,
                            cursorColor: HexColor('#868788'),
                            onChanged: onTextChanged,
                            textAlign: TextAlign.left,
                            textInputAction: textInputAction,
                            style: FontStyle.medium14Black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: _height * 0.25, bottom: _height * 0.25, right: 10),
                              hintText: 'Search',
                              hintStyle: needBoxDecoration
                                  ? FontStyle.grey14SearchHintMedium
                                  : FontStyle.noBorderSearchHint,
                              isDense: true,
                              border: InputBorder.none,
                            )),
                      ),
                      textController.isEmpty
                          ? Padding(
                        padding:EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/image/sacnner.png',
                          height: _height * 0.5,
                          width: _height * 0.5,
                        ),
                      )
                          : IconButton(
                              icon: Icon(
                                Icons.close,
                                color: HexColor('#727272'),
                              ),
                              onPressed: onClearTap,
                            )
                    ],
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
