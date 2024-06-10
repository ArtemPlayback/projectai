import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_of_service_model.dart';
export 'terms_of_service_model.dart';

class TermsOfServiceWidget extends StatefulWidget {
  const TermsOfServiceWidget({super.key});

  @override
  State<TermsOfServiceWidget> createState() => _TermsOfServiceWidgetState();
}

class _TermsOfServiceWidgetState extends State<TermsOfServiceWidget> {
  late TermsOfServiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsOfServiceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 16.0, 24.0),
                      child: Text(
                        'USER AGREEMENT FOR THE APPLICATION',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'LTSuperior',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w800,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 24.0),
                        child: Text(
                          '1. DEFINITION OF TERMS\nIn this Agreement, the following terms have the meanings ascribed to them below:\n\"Company\", \"We\", \"Our\", \"Us\", \"Ours\" or any other similar derivatives (depending on context) refer to the following entity: SPARKLER SOFT SP. Z O.O., located at Poland, Warszawa, 00-755, ul. KONDUKTORSKA, nr 18, lok. 7. (including its branches and representatives both in the Russian Federation and abroad, as well as any other entities formed as a result of the Company\'s reorganization), which are the owners or managers of the Application.\n\"Application Content\" means all objects placed by the Company and/or third parties (with the Company\'s permission) in the Application, including design elements, text, graphic images, illustrations, virtual objects, videos, programs, music, sounds, information, notifications, and any other similar objects, their collections or combinations.\n\"Updates\" refers to a software patch or package for the Application, periodically released by the Company, offered for free download by Users already using the Application, aimed at fixing non-working features of the Application, eliminating bugs (errors) in the Application, or introducing minor software components for greater security and compatibility of the Application with devices.\n\"Platform\" means the cloud platform where the Company has placed the Application for subsequent download by the User. This Application is available for download from the App Store and Google Play.\n\"Application Software\" refers to the software developed by the Company (and/or third parties on behalf of the Company) for the Application, including, but not limited to, all software, scripts, codes (HTML codes), programs, etc.\n\"User\", \"You\", \"Your\", \"Yours\", \"Yourself\" or any other similar derivatives (depending on context) refer to a person who (1) uses the Application and has access to the Services; and (2) has agreed to comply with the rules of using the Application, as set out in the text of this Agreement, by creating a personal account (cabinet).\n\"User Content\" means (1) all publications made by the User in the Application, including, but not limited to, comments; ratings; reviews; reports; feedback; posted videos, photos, music, and other media files; likes; ratings and/or any other forms of activity available to the User, as well as (2) any other content created by the User.\n\"Application\" refers to the following application: NeuroProject, which the User downloads through the Platform onto a smartphone or other device.\n\"Services\" collectively means the Application Content and the Application Software.\n\"In-app purchase\" refers to the User\'s acquisition, for a fee, of additional features and/or functionality for the Application and/or the purchase of any virtual goods/services within the Application.\n\n2. ACCEPTANCE OF THE AGREEMENT\nGeneral Provisions\n2.1. This User Agreement (hereinafter \"Agreement\") defines the rules and procedures for using the Application, the rights and obligations of Users, and regulates the behavior of Users when accessing the Application and Services.\n2.2. The User accepts the terms of this Agreement by creating a personal account.\n2.3. This Agreement is binding for its parties (i.e., the Company and the User). The User can assign their rights under this Agreement only after obtaining prior written consent from the Company.\n2.4. If you are the legal representative (parent, guardian) of a minor User, then you automatically agree on your behalf and on behalf of such a minor User to the terms of this Agreement.\n\nWarning for Users\n2.5. If the User accesses the Application and/or its Services through the Platform or social networks (for example, Facebook, Vkontakte, Odnoklassniki), the User is automatically considered to have accepted the terms of the user agreement of such Platform or social network.\n2.6. The User acknowledges that their agreement with the mobile network provider (hereinafter \"Provider\") will apply to the use of this Application. The User also acknowledges that the Provider may from time to time charge the User for data transmission services when using certain features of the Application, as well as any other fees and payments arising in connection with such transmission, for which the User agrees to be responsible. If the User is not the bill payer of the Provider for the smartphone or other device used to access the Application, it is assumed that such a User has received permission from the bill payer to use the Application.\n2.7. The User is solely responsible for checking and controlling the compatibility of the installed Application with the technical features/capabilities of the smartphone or other device and/or other restrictions that may be applicable to the User and/or their smartphone or other device by third parties, including the Internet provider.\n\n\n3. APPLICATION USERS\nGeneral Criteria and Age\n3.1. To use the Application, Users must meet the following criteria collectively:\n(1) Be at least 18 years old; and\n(2) Not be restricted from accessing the Application and Services by a legally binding court decision or as provided by applicable law or the terms of this Agreement; and\n(3) Meet the following conditions/criteria:\nNot have a criminal record for causing harm to another person or their honor and dignity.\n\nCreating a Personal Account\n3.2. To access the Services, Users need to create their personal account. Usage of the Services without registration (i.e., creating a personal account (cabinet)) is not possible. Upon completion of the registration, the User receives a unique login and password to access their personal account (cabinet).\n3.3. To create a personal account, the User must provide the following information about themselves:\nRegistration for individuals:\nFull name, date of birth, phone number, email, Telegram username, and any other information that can be left in the application.\nRegistration for businesses:\nFull name, date of birth, phone number, email, Telegram username, and any other information that can be left in the application.\n\n\n4. INTELLECTUAL PROPERTY\nUser License\n4.1. The User is granted a non-exclusive, non-transferable, and non-sublicensable license for personal (non-commercial) use of the Services (hereinafter \"User License\"). The User undertakes not to use the Services for any other purposes. The User is granted the aforementioned User License ONLY if ALL the conditions of this Agreement are met.\n4.2. The User License automatically terminates upon deletion of the Application from the User\'s smartphone or other device. Nothing in this Agreement shall be construed as granting the User any other license to use intellectual property owned or possessed by the Company, other than that provided above.\n\nCompany\'s Intellectual Property\n4.3. The Company owns all proprietary rights, including intellectual property rights, to all Application Content and the Application Software. The Application Software and Application Content are protected by copyright as provided by the current civil legislation of the Russian Federation, as well as international treaties and conventions in the field of intellectual property protection.\n4.4. USERS ARE PROHIBITED from copying, reproducing, modifying, compiling, distributing, displaying in any form, publishing, downloading, transmitting, selling (in whole or in part), alienating in any possible way for a fee or for free, sublicensing, distributing, or using the Application Content and Application Software in any way, except where such actions are DIRECTLY permitted by the terms of this Agreement or the current legislation of the Russian Federation.\n4.5. Nothing in this Agreement shall be construed as transferring to the User any exclusive rights to the Application Content (in whole or in part) and/or Application Software.\n4.6. The Company owns all rights to trademarks, trade (business) names, brands, logos registered in its name (hereinafter \"Trademarks\"). Such Trademarks are protected by current legislation and NOTHING in this Agreement shall be construed as granting any license to the User to use such Trademarks.\n\n\n5. OPERATING PROCEDURES FOR THE APPLICATION\nGeneral Provisions\n5.1. The User agrees to adhere to the following rules when using the Application:\n\nComply with all obligations undertaken when joining this Agreement.\nProvide accurate personal information for creating a personal account.\nNot impersonate any other person or use third-party information without their explicit, prior, and informed consent to create a personal account.\nInform the Company of any theft of login details, passwords, or other access keys to the personal account.\nNot provide third parties access to their account and/or login details, passwords, or other access keys.\nNot upload, store, publish, distribute, place, advertise, send, provide access to, or otherwise use User Content that:\n(a) Contains threats, discredits, insults, harms the honor, dignity, or business reputation, or violates the privacy of other Users or third parties.\n(b) Is spam, bullying, vulgar or indecent, contains pornographic images and texts, sexual scenes including minors, or scenes of violence, including sexual, against people or animals.\n(c) Contains any forms of incitement to suicide and/or promotes or contributes to the incitement of racial, religious, ethnic hatred or enmity, promotes fascism or racial supremacy ideology, or contains extremist materials.\n(d) Promotes the violation of rights or legitimate interests of other Users or third parties, or promotes crime or contains advice/guidelines/instructions for committing it.\n(e) Violates other rules of this Agreement or is prohibited by current legislation.\nNot undertake any actions (with or without automation) aimed at collecting personal data of other Users.\nNot take any actions, nor assist third parties in actions, aimed at undermining the operation of the Application and/or Services.\nNot engage in any other actions that are illegal, fraudulent, discriminatory, or misleading.\nRights of Users to Posted Content\n5.2. The User-generated content created by you is an object of intellectual property protected by law, and the Company does not claim or require from you any property rights to your User Content. Nothing in this Agreement shall be construed as depriving the User of rights to their User Content.\n5.3. You grant the Company a non-exclusive, royalty-free, worldwide license (the \"License\") with the right to transfer and sublicense for the storage, use, distribution, modification, launching, copying, public performance or display, translation of your User Content and the creation of derivative works based on it.\n5.4. The License granted by you automatically terminates if your personal account is deleted or if the Application is removed from your smartphone or other device.\n5.5. The Company shall take all possible actions to fully delete your User Content immediately after the License terminates, except when: (1) part of your User Content has been used by other Users (in which case your User Content will be available to other Users until it is deleted by another User); (2) the User Content you posted serves as evidence of a violation, misdemeanor, or crime in criminal, administrative, or civil proceedings, or its subsequent storage is required by law or a competent state authority\'s request; or (3) in other cases specified in this Agreement.\nUser Content Requirements\n5.6. Users are prohibited from uploading any User Content that may belong to third parties or for which rights have not been adequately granted to the User. The User undertakes to compensate the Company for ALL DAMAGES AND LEGAL COSTS incurred in connection with third-party claims that the published User Content infringes the intellectual property rights of such third parties.\n5.7. It is not recommended for the User to upload any User Content that may contain confidential or personal information. The Company considers any User Content as non-confidential and does not undertake any obligations to protect it from disclosure or third-party infringement.\n5.8. The Company does not verify and cannot verify all materials published by Users as part of their User Content, and therefore is not responsible for the content of such User Content, its use, or its impact on third parties or other Users.\n5.9. The User is responsible for their own protection and the protection of their device from viruses and other malicious software. The Company is not responsible for any damage resulting from the use of the Application, its Services, and/or User Content (including its download).\n5.10. The Company has the right at any time to check the User Content for compliance with the requirements of this Agreement or current legislation. However, nothing in this Agreement shall be construed as a direct obligation of the Company to conduct any independent check of the User Content, except at the request of other Users or third parties.\n5.11. If you encounter User Content that violates the terms of this Agreement or legal rights and interests of Users or third parties, you can report it by:\nSending an email to: Artem.vs94ski@gmail.com\n5.12. If User Content is found to violate the terms of this Agreement or applicable law, the Company may, at its discretion, at any time, without warning the User and without assuming any future responsibility, completely remove such User Content, or in case of repeated violations, delete your personal account.\n5.13. To comply with part 1 of Article 10-6 of the Federal Law \"On Information, Information Technologies and Information Protection,\" the Company has the right to internally monitor User Content to ensure compliance with the restrictions set out in the Federal Law.\nFeedback on the Application\n5.14. Users have the right (but are not obliged) to occasionally submit their ideas, feedback, suggestions, or projects aimed at improving the Application or the quality of Services. Feedback can be sent as follows:\nSending an email to: Artem.vs94ski@gmail.com\n5.15. By submitting such ideas, feedback, suggestions, or projects, the User automatically grants us a non-exclusive, royalty-free, worldwide license with the right to transfer and sublicense for the storage, use, distribution, modification, launch, copying, public performance or display, translation of your ideas, feedback, suggestions, or projects, and the creation of derivative works based on them.\n5.16. Any such information provided to the Company is automatically considered non-confidential.\n\n\n6. ADVERTISING PLACEMENT IN THE APPLICATION\nAdvertising Placement by the Company\n6.1. The Company reserves the right to periodically place various advertising or marketing materials.\nAdvertising Placement by Third Parties\n6.2. The Application Content may contain links to third-party websites and/or advertising or marketing materials about goods/services provided by such third parties (\"Third-Party Advertising\"). The COMPANY ASSUMES NO RESPONSIBILITY for (1) the content of Third-Party Advertising, including the availability, quality, and safety of the promoted goods/services in such advertising; and (2) any losses, damages, or harm incurred or caused to the User as a result of reading such advertising or using the goods/services promoted in Third-Party Advertising.\n\n6.3. When accessing another site through Third-Party Advertising, the Company cannot guarantee that such a website is safe for the User and/or their computer. Nothing in this Agreement should be construed as an assurance, encouragement, recommendation, or incitement for the User to use Third-Party Advertising, visit any third-party sites, or try, purchase, or use any goods/services of third parties.\n\n\n7. PROCESSING PAYMENTS THROUGH THE APPLICATION\n7.1. The Application does not provide the capability to purchase any goods/services through it.\n\n\n8. IN-APP PURCHASES\n8.1. The Application does not support any in-app purchases.\n\n9. ACCESS TO THE APPLICATION\nGeneral Provisions\nACCESS TO THE APPLICATION\n\n9.1. The Company reserves the right to change or modify the Application Content at any time without prior notice and at its discretion. It also reserves the right to modify, interrupt, or discontinue any part or the entire Application without additional notice. The Company is not responsible for any changes, modifications, deletions, discontinuations, or interruptions in the operation of the Application.\n\n9.2. The Company does not guarantee constant availability of the Application and Services. There may be equipment or software malfunctions requiring time to resolve, potentially leading to disruptions, delays, or errors in the Application. The Company may alter, revise, update, suspend, discontinue, or otherwise change the Application at any time without notice. The User acknowledges that the Company is not liable for any losses, damages, or inconveniences caused by inability to access or use the Application during downtime or discontinuation.\nPROVIDING UPDATES\n9.3. The Company may periodically provide updates and require their installation on the User\'s device. The User is solely responsible for installing these updates and for any losses, damages, or missed profits caused by delayed or non-installation of updates.\nACCOUNT DELETION\n9.4. Users may discontinue using the Application by deleting it from their device.\n9.5. The Company may terminate a User\'s access to the Application and Services by deleting their account in cases of Agreement violation, intellectual property rights infringement, illegal actions, or as required by law.\n9.6. In all cases of account deletion or Application removal, all User data and information will be irreversibly deleted. The Company is not responsible for any loss or damages resulting from this deletion.\n\n\n10. ASKING QUESTIONS\n10.1. If you have any questions regarding the terms of this Agreement or the manner/method of its execution, you can address your question in the following way:\nSend an email to: Artem.vs94ski@gmail.com\n10.2. Employees and representatives of the Company will make every effort to respond to your inquiry within a reasonable period of time.\n\n\n11. LIABILITY\n11.1. Under no circumstances shall the Company or its representatives be liable to the User or any third parties for:\nAny indirect, incidental, or unintentional damage, including lost profits or lost data, damage to honor, dignity, or business reputation, caused by the use of the Application, Services, or any materials accessed through the Application.\nThe actions of other Users, User-generated content, goods/services provided by third parties or other Users (even if accessed through our Application).\n11.2. Our liability related to the use of the Application and/or Services is limited to the maximum extent permitted by applicable law.\n\n\n12. DISPUTE RESOLUTION\n12.1. In case of any disputes or disagreements related to the execution of this Agreement, the User and the Company shall make every effort to resolve them through negotiations. If disputes cannot be resolved through negotiations, they shall be resolved according to the current legislation\n\n\n13. FINAL PROVISIONS\n13.1. The Company may periodically revise, supplement, or change the terms of this Agreement. These changes are typically not retroactive. The Company is not obliged to notify users of upcoming or completed changes. By agreeing to this Agreement, the User also agrees to periodically review its terms for any changes or additions. Continuing to use the Application after changes implies acceptance of these changes or additions without objection.\n13.2. Unless otherwise stated in this Agreement or arising from applicable law, the terms of this Agreement are governed by the substantive law of the Russian Federation.\n13.3. If any provision of this Agreement is found to be legally unenforceable or invalid, the remaining provisions will still be effective, as if the invalid or unenforceable provision was never included.\n13.4. Access to the Application and its Services is provided \"as is.\" The Company does not promise, guarantee, or imply that the Services and Application will meet your needs, goals, or expectations, nor does it guarantee any specific results or consequences from using the Application and its Services.\n',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'LTSuperior',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 80.0))
                    .addToEnd(SizedBox(height: 40.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: Color(0x33007AFF),
                        icon: Icon(
                          Icons.chevron_left,
                          color: Color(0xFF007AFF),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
