import 'package:hive/hive.dart';
import 'package:squadsyncweb/bussiness/entity/user.dart';
import 'package:squadsyncweb/data/model/org_id.dart';
import 'package:squadsyncweb/data/model/reponse_create_org_admin.dart';
import 'package:squadsyncweb/data/model/response_create_organization.dart';

UserToken userToken = UserToken(
  accessToken: '',
);
late Box<UserToken> userTokenBox;

ResponseCreateOrganization responseCreateOrganization =
    ResponseCreateOrganization(
  id: 0,
  legalName: '',
  telephone: '',
  orgType: '',
  organizationSport: '',
  organizationSportsId: 0,
  addressId: 0,
  affiliationId: 0,
);

ResponseCreateOrgAdmin responseCreateOrgAdmin = ResponseCreateOrgAdmin(
    message: "",
    firstName: '',
    lastName: '',
    emailId: '',
    organization: '',
    status: 0);

List<OrgId> listOfOrg = [];
