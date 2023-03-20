import 'package:binance_test/resources/app_colors.dart';
import 'package:binance_test/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
        child: Column(
          children: [
            const AppBarWidget(),
            const SizedBox(
              height: 20,
            ),
            const SelectedCoin(),
            const SizedBox(
              height: 15,
            ),
            const BodyCombined(),
            const SizedBox(
              height: 17,
            ),
            BuyBtc(),
            const SizedBox(
              height: 28,
            ),
            const OpenOrders(),
            const SizedBox(
              height: 12,
            ),
            const ShowOrdersWidget(),
            const SizedBox(
              height: 9,
            ),
            ValueListenableBuilder(
                valueListenable: isSelected,
                builder: (context, value, child) {
                  return isSelected.value
                      ? const ListOfOrders()
                      : const SizedBox.shrink();
                })
          ],
        ),
      ),
    );
  }
}

ValueNotifier<bool> isSelected = ValueNotifier(true);

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool tapped1 = true;
  bool tapped2 = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 22,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyDigitsColor, width: 0.5),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 2 - 21,
            height: size.height / 22,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor:
                      tapped1 ? Colors.white : AppColors.greyDigitsColor,
                  backgroundColor: tapped1
                      ? AppColors.boxesBackgroundColor
                      : Colors.transparent,
                ),
                onPressed: () {
                  setState(() {
                    tapped1 = true;
                    tapped2 = false;
                  });
                },
                child: const Text(
                  'Charts',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )),
          ),
          SizedBox(
              width: size.width / 2 - 21,
              height: size.height / 22,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor:
                        tapped2 ? Colors.white : AppColors.greyDigitsColor,
                    backgroundColor: tapped2
                        ? AppColors.boxesBackgroundColor
                        : Colors.transparent,
                  ),
                  onPressed: () {
                    setState(() {
                      tapped2 = true;
                      tapped1 = false;
                    });
                  },
                  child: const Text(
                    'Trade',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ))),
        ],
      ),
    );
  }
}

class SelectedCoin extends StatelessWidget {
  const SelectedCoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              children: [
                Image.asset(AppImages.selectedCoinTop),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(AppImages.selectedCoinTop),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'BTC/USDT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 24,
              width: 64,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromRGBO(32, 201, 150, 0.226)),
              child: Center(
                child: Text(
                  '+2.38%',
                  style: TextStyle(
                      color: AppColors.greenDigitsColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(AppImages.crop),
            const SizedBox(
              width: 21,
            ),
            SvgPicture.asset(AppImages.dots)
          ],
        )
      ],
    );
  }
}

class BtcAmountButtons extends StatelessWidget {
  const BtcAmountButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 200,
            height: 42,
            decoration: BoxDecoration(
                color: AppColors.boxesBackgroundColor,
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    splashRadius: 2,
                    onPressed: () {},
                    icon: const Icon(Icons.remove,
                        size: 16, color: Color.fromRGBO(255, 255, 255, 0.4))),
                Container(
                  width: 103,
                  child: TextField(
                    controller: TextEditingController(text: '43,805.35'),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Price',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                IconButton(
                    splashRadius: 2,
                    onPressed: () {},
                    icon: const Icon(Icons.add,
                        size: 16, color: Color.fromRGBO(255, 255, 255, 0.4)))
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: 200,
            height: 42,
            decoration: BoxDecoration(
                color: AppColors.boxesBackgroundColor,
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    splashRadius: 2,
                    onPressed: () {},
                    icon: const Icon(Icons.remove,
                        size: 16, color: Color.fromRGBO(255, 255, 255, 0.4))),
                Container(
                  width: 103,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Amount (BTC)',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                IconButton(
                    splashRadius: 2,
                    onPressed: () {},
                    icon: const Icon(Icons.add,
                        size: 16, color: Color.fromRGBO(255, 255, 255, 0.4)))
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SvgPicture.asset(AppImages.slider),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: 200,
            height: 42,
            decoration: BoxDecoration(
                color: AppColors.boxesBackgroundColor,
                borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: Container(
                width: 120,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Total (USDT)',
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            height: 22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Avbl',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('1 000.00 USDT',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 25,
                      child: FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Colors.white,
                        elevation: 1,
                        onPressed: () {},
                        child: Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(125, 134, 150, 1)),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BodyCombined extends StatelessWidget {
  const BodyCombined({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [BtcAmountButtons(), BtcCourse()],
    );
  }
}

class BtcCourse extends StatelessWidget {
  const BtcCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImages.loss),
        SvgPicture.asset(AppImages.profit)
      ],
    );
  }
}

class BuyBtc extends StatelessWidget {
  BuyBtc({super.key});
  String dropdownValue = '0.01';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.buyButtonColor,
              borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: InkWell(
              child: const Text(
                'Buy BTC',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              onTap: () {},
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.boxesBackgroundColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: DropdownButton<String>(
                  underline: const SizedBox.shrink(),
                  dropdownColor: AppColors.boxesBackgroundColor,
                  iconEnabledColor: Colors.white,
                  value: dropdownValue,
                  items: <String>['0.01', '0.02', '0.03', '0.04']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4.0, 5, 4, 5),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.boxesBackgroundColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImages.partOfMenuRedDot),
                      SvgPicture.asset(AppImages.partOfMenuGreenDot)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImages.parOfMenu),
                      SvgPicture.asset(AppImages.parOfMenu),
                      SvgPicture.asset(AppImages.parOfMenu),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OpenOrders extends StatelessWidget {
  const OpenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 123,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.boxesBackgroundColor),
                child: const Center(
                  child: Text(
                    'Open Orders (4)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Center(
                child: Text('Funds',
                    style: TextStyle(
                        color: AppColors.greyDigitsColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600))),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.grey, width: 1.5),
          ),
          width: 16,
          height: 18,
          child: SvgPicture.asset(AppImages.itemsOfOrderIcon),
        )
      ],
    );
  }
}

class ShowOrdersWidget extends StatefulWidget {
  const ShowOrdersWidget({super.key});

  @override
  State<ShowOrdersWidget> createState() => _ShowOrdersWidgetState();
}

class _ShowOrdersWidgetState extends State<ShowOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              child: Checkbox(
                  activeColor: AppColors.checkBoxColor,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(64)),
                  value: isSelected.value,
                  onChanged: (value) => setState(() {
                        isSelected.value = !isSelected.value;
                      })),
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              'Show all ',
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyDigitsColor,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              color: AppColors.boxesBackgroundColor,
              borderRadius: BorderRadius.circular(6)),
          child: const Center(
              child: Text(
            'Cancel all',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),
          )),
        ),
      ],
    );
  }
}

class ListOfOrders extends StatefulWidget {
  const ListOfOrders({super.key});

  @override
  State<ListOfOrders> createState() => _ListOfOrdersState();
}

class _ListOfOrdersState extends State<ListOfOrders> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Divider(
                height: 0.5,
                thickness: 0.5,
                color: AppColors.greyDigitsColor,
              ),
              const SizedBox(
                height: 14.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TBCC / USDT',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      Text('2022-03-06 17:50:12',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: AppColors.greyDigitsColor))
                    ],
                  ),
                  Text(
                    'Limit / Buy',
                    style: TextStyle(
                        color: AppColors.greenDigitsColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.greyDigitsColor),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Row(
                        children: [
                          const Text(
                            '0,00 ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Text('/ 4407,32',
                              style: TextStyle(
                                  color: AppColors.greyDigitsColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyDigitsColor),
                          ),
                          const SizedBox(
                            width: 51,
                          ),
                          Row(
                            children: const [
                              Text(
                                '0,0673',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: AppColors.boxesBackgroundColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                            child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14),
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
