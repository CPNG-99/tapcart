import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/domain/entities/store/store.dart';
import 'package:tapcart/presentation/bloc/auth/member_detail/member_detail_bloc.dart';

class SellerProfilePage extends StatefulWidget{
  const SellerProfilePage({Key? key}) : super(key: key);

  @override
  State<SellerProfilePage> createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
            () => context.read<MemberDetailBloc>().add(const OnGetMemberDetail()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: BlocBuilder<MemberDetailBloc, MemberDetailState>(
              builder: (context, state) {
            if (state is MemberDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HasMemberDetailData) {
              Store store = state.result;
              final UriData? base64Image = Uri.parse(store.image).data;
              final image = base64Image?.contentAsBytes();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Center(
                    child:
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: kGreySoft),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          image: MemoryImage(
                              image!
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(height: 20,),
                  Text("Store Name", style: kButtonText,),
                  TextFormField(
                    readOnly: true,
                    controller: TextEditingController(text:  store.storeName),
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Store Name",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("Store Address", style: kButtonText,),
                  TextFormField(
                    readOnly: true,
                    controller: TextEditingController(text:  store.storeAddress),
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: "Store Address",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("Open Hour", style: kButtonText,),
                  TextFormField(
                    readOnly: true,
                    controller: TextEditingController(text:  store.openHours),
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Open Hour",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(
                            context,
                            SELLER_PROFILE_QR_PAGE,
                            arguments: store
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(130, 40)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.qr_code_scanner, size: 20,),
                            SizedBox(width: 5,),
                            Text(
                                "QR"
                            ),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(height: 50,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, SELLER_EDIT_PROFILE_PAGE);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, size: 18,),
                          SizedBox(width: 5,),
                          Text(
                              "Edit"
                          ),
                        ],
                      )
                  )
                ],
              );
            } else if (state is MemberDetailError) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamed(HOME_ROUTE);
              });
            }
            return const Center();
          }),
        ),
      ),
    );
  }
}