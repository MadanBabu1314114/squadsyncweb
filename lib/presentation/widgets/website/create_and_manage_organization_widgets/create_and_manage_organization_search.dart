import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAndManageOrganizationSearch extends StatelessWidget {
  const CreateAndManageOrganizationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 271,
            height: 32,
            child: ElevatedButton(
              style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(5),
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  surfaceTintColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  )),
              onPressed: () {
                context.go('/add-new-organization');
                print("Madan");
              },
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0075FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'ADD NEW ORGANIZATION',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: const Color(0xFF1B59F8)),
                  ),
                ],
              ),
            ),
          ),
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
                    hintText: 'SEARCH ORGANIZATION',
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
