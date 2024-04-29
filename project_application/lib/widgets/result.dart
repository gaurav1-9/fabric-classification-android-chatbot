import 'package:flutter/material.dart';

import '../global_properties/app_colors.dart';

class Result extends StatelessWidget {
  final String resultCNN;
  final String resultresNet;
  final String accresNet;
  final String resultViT;
  final String accViT;
  const Result({
    super.key,
    required this.resultCNN,
    required this.resultresNet,
    required this.accresNet,
    required this.resultViT,
    required this.accViT,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .74,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CNN Result:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppColor.jet,
            ),
          ),
          Row(
            children: [
              const Text(
                "Predicted as: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.jet,
                ),
              ),
              Text(
                resultCNN,
                style: const TextStyle(
                  color: AppColor.jet,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "ResNet50 Result:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.jet,
              fontSize: 25,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Predicted as: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.jet,
                    ),
                  ),
                  Text(
                    resultresNet,
                    style: const TextStyle(
                      color: AppColor.jet,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Accuracy: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.jet,
                    ),
                  ),
                  Text(
                    "$accresNet%",
                    style: const TextStyle(
                      color: AppColor.jet,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Vision Transformer (ViT) Result:",
            style: TextStyle(
              height: 1,
              fontWeight: FontWeight.bold,
              color: AppColor.jet,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Predicted as: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.jet,
                    ),
                  ),
                  Text(
                    resultViT,
                    style: const TextStyle(
                      color: AppColor.jet,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Accuracy: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.jet,
                    ),
                  ),
                  Text(
                    "$accViT%",
                    style: const TextStyle(
                      color: AppColor.jet,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
