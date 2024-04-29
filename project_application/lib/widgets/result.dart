import 'package:flutter/material.dart';

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
      width: MediaQuery.of(context).size.width * .83,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CNN Result:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Row(
            children: [
              const Text(
                "Predicted as: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                resultCNN,
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
                    ),
                  ),
                  Text(
                    resultresNet,
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Accuracy: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$accresNet%",
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Vision Transformer (ViT)\nResult:",
            style: TextStyle(
              height: 1,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 5,
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
                    ),
                  ),
                  Text(
                    resultViT,
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Accuracy: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$accViT%",
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
