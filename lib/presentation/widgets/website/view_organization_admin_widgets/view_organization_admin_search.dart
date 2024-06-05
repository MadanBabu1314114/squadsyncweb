import 'package:flutter/material.dart';

class ViewOrganizationAdminSearch extends StatelessWidget {
  const ViewOrganizationAdminSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Container(
            width: 375,
            height: 32,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: const TextField(
                cursorHeight: 20,
                clipBehavior: Clip.hardEdge,
                decoration: InputDecoration(
                    hintText: 'SEARCH ORGANIZATION ADMIN',
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
