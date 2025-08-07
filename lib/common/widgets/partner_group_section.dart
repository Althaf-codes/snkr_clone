import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

class PartnerGroupSection extends StatefulWidget {
  const PartnerGroupSection({super.key});

  @override
  State<PartnerGroupSection> createState() => _PartnerGroupSectionState();
}

class _PartnerGroupSectionState extends State<PartnerGroupSection> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "OUR BRANDED PARTNERS",
            style: AppConstants.headingBlack.copyWith(
              fontSize: 20,
              letterSpacing: 1,
            ),
          ),
        ),
        Container(
          height: 100,
          // color: Colors.blue,
          child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 150,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppConstants.lightBlackColor),
                    ),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9Ur97qMPnBQ13RZidLdpj_Wc6ZOQdJwVq5g&s",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
