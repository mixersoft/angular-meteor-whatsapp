# sms.coffee
'use strict'



# // Add in order to use with a real twilio account
# // SMS.twilio = {
# //   ACCOUNT_SID: Meteor.settings.TWILIO.SID,
# //   AUTH_TOKEN: Meteor.settings.TWILIO.TOKEN
# // };
if Meteor.isServer
  if Meteor.settings && Meteor.settings.TWILIO.SID
    Accounts._options.adminPhoneNumbers = Meteor.settings.ACCOUNTS_PHONE.ADMIN_NUMBERS
    Accounts._options.phoneVerificationMasterCode = Meteor.settings.ACCOUNTS_PHONE.MASTER_CODE