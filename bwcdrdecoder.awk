#!/usr/bin/env -S gawk -f
##
## BroadWorks CDR Decoder
##
## Adapted from version published by Mark Lindsey:
## https://www.ecg.co/blog/119-broadworks-cdr-decoder
##
## CHANGELOG:
##
## 20200819 - Import
## 20200819 - Updated to CDR Schema 23.0
## 20220719 - Minor improvement for escaped comma handling
##

{ 
    for (fieldNum in cdrFieldName) {
        gsub(/\\,/, "DELIMSPLIT");
        printf("\t%4i %60s: %s\n", fieldNum, cdrFieldName[fieldNum], gensub(/DELIMSPLIT/,",","g",$fieldNum));
    }
}
BEGIN { 
    FS=","
    cdrFieldName[1]="recordId"
    cdrFieldName[2]="serviceProvider"
    cdrFieldName[3]="type"
    cdrFieldName[4]="userNumber"
    cdrFieldName[5]="groupNumber"
    cdrFieldName[6]="direction"
    cdrFieldName[7]="callingNumber"
    cdrFieldName[8]="callingPresentationIndicator"
    cdrFieldName[9]="calledNumber"
    cdrFieldName[10]="startTime"
    cdrFieldName[11]="userTimeZone"
    cdrFieldName[12]="answerIndicator"
    cdrFieldName[13]="answerTime"
    cdrFieldName[14]="releaseTime"
    cdrFieldName[15]="terminationCause"
    cdrFieldName[16]="networkType"
    cdrFieldName[17]="carrierIdentificationCode"
    cdrFieldName[18]="dialedDigits"
    cdrFieldName[19]="callCategory"
    cdrFieldName[20]="networkCallType"
    cdrFieldName[21]="networkTranslatedNumber"
    cdrFieldName[22]="networkTranslatedGroup"
    cdrFieldName[23]="releasingParty"
    cdrFieldName[24]="route"
    cdrFieldName[25]="networkCallID"
    cdrFieldName[26]="codec"
    cdrFieldName[27]="accessDeviceAddress"
    cdrFieldName[28]="accessCallID"
    cdrFieldName[29]="spare"
    cdrFieldName[30]="failoverCorrelationId"
    cdrFieldName[31]="spare"
    cdrFieldName[32]="group"
    cdrFieldName[33]="department"
    cdrFieldName[34]="accountCode"
    cdrFieldName[35]="authorizationCode"
    cdrFieldName[36]="originalCalledNumber"
    cdrFieldName[37]="originalCalledPresentationIndicator"
    cdrFieldName[38]="originalCalledReason"
    cdrFieldName[39]="redirectingNumber"
    cdrFieldName[40]="redirectingPresentationIndicator"
    cdrFieldName[41]="redirectingReason"
    cdrFieldName[42]="chargeIndicator"
    cdrFieldName[43]="typeOfNetwork"
    cdrFieldName[44]="voicePortalCalling.invocationTime"
    cdrFieldName[45]="localCallId"
    cdrFieldName[46]="remoteCallId"
    cdrFieldName[47]="callingPartyCategory"
    cdrFieldName[48]="spare"
    cdrFieldName[49]="spare"
    cdrFieldName[50]="spare"
    cdrFieldName[51]="spare"
    cdrFieldName[52]="spare"
    cdrFieldName[53]="spare"
    cdrFieldName[54]="spare"
    cdrFieldName[55]="spare"
    cdrFieldName[56]="spare"
    cdrFieldName[57]="spare"
    cdrFieldName[58]="spare"
    cdrFieldName[59]="key"
    cdrFieldName[60]="creator"
    cdrFieldName[61]="originatorNetwork"
    cdrFieldName[62]="terminatorNetwork"
    cdrFieldName[63]="accountCodePerCall.invocationTime"
    cdrFieldName[64]="accountCodePerCall.facResult"
    cdrFieldName[65]="acbActivation.invocationTime"
    cdrFieldName[66]="acbActivation.facResult"
    cdrFieldName[67]="acbDeactivation.invocationTime"
    cdrFieldName[68]="acbDeactivation.facResult"
    cdrFieldName[69]="callPark.invocationTime"
    cdrFieldName[70]="callPark.facResult"
    cdrFieldName[71]="callParkRetrieve.invocationTime"
    cdrFieldName[72]="callParkRetrieve.facResult"
    cdrFieldName[73]="callPickup.invocationTime"
    cdrFieldName[74]="callPickup.facResult"
    cdrFieldName[75]="directedCallPickup.invocationTime"
    cdrFieldName[76]="directedCallPickup.facResult"
    cdrFieldName[77]="directedCPUBargeIn.invocationTime"
    cdrFieldName[78]="directedCPUBargeIn.facResult"
    cdrFieldName[79]="cancelCWTperCall.invocationTime"
    cdrFieldName[80]="cancelCWTperCall.facResult"
    cdrFieldName[81]="cfaActivation.invocationTime"
    cdrFieldName[82]="cfaActivation.facResult"
    cdrFieldName[83]="cfaDeactivation.invocationTime"
    cdrFieldName[84]="cfaDeactivation.facResult"
    cdrFieldName[85]="cfbActivation.invocationTime"
    cdrFieldName[86]="cfbActivation.facResult"
    cdrFieldName[87]="cfbDeactivation.invocationTime"
    cdrFieldName[88]="cfbDeactivation.facResult"
    cdrFieldName[89]="cfnaActivation.invocationTime"
    cdrFieldName[90]="cfnaActivation.facResult"
    cdrFieldName[91]="cfnaDeactivation.invocationTime"
    cdrFieldName[92]="cfnaDeactivation.facResult"
    cdrFieldName[93]="clidDeliveryPerCall.invocationTime"
    cdrFieldName[94]="clidDeliveryPerCall.facResult"
    cdrFieldName[95]="clidBlockingPerCall.invocationTime"
    cdrFieldName[96]="clidBlockingPerCall.facResult"
    cdrFieldName[97]="customerOriginatedTrace.invocationTime"
    cdrFieldName[98]="customerOriginatedTrace.facResult"
    cdrFieldName[99]="directVMTransfer.invocationTime"
    cdrFieldName[100]="directVMTransfer.facResult"
    cdrFieldName[101]="dndActivation.invocationTime"
    cdrFieldName[102]="dndActivation.facResult"
    cdrFieldName[103]="dndDeactivation.invocationTime"
    cdrFieldName[104]="dndDeactivation.facResult"
    cdrFieldName[105]="sacLocking.invocationTime"
    cdrFieldName[106]="sacLocking.facResult"
    cdrFieldName[107]="sacUnlocking.invocationTime"
    cdrFieldName[108]="sacUnlocking.facResult"
    cdrFieldName[109]="flashCallHold.invocationTime"
    cdrFieldName[110]="flashCallHold.facResult"
    cdrFieldName[111]="lastNumberRedial.invocationTime"
    cdrFieldName[112]="lastNumberRedial.facResult"
    cdrFieldName[113]="returnCall.invocationTime"
    cdrFieldName[114]="returnCall.facResult"
    cdrFieldName[115]="sd100Programming.invocationTime"
    cdrFieldName[116]="sd100Programming.facResult"
    cdrFieldName[117]="sd8Programming.invocationTime"
    cdrFieldName[118]="sd8Programming.facResult"
    cdrFieldName[119]="clearMWI.invocationTime"
    cdrFieldName[120]="clearMWI.facResult"
    cdrFieldName[121]="userId"
    cdrFieldName[122]="otherPartyName"
    cdrFieldName[123]="otherPartyNamePresentationIndicator"
    cdrFieldName[124]="musicOnHoldPerCallDeactivation.invocationTime"
    cdrFieldName[125]="musicOnHoldPerCallDeactivation.facResult"
    cdrFieldName[126]="pushtoTalk.invocationTime"
    cdrFieldName[127]="pushtoTalk.facResult"
    cdrFieldName[128]="hoteling.invocationTime"
    cdrFieldName[129]="hoteling.group"
    cdrFieldName[130]="hoteling.userId"
    cdrFieldName[131]="hoteling.userNumber"
    cdrFieldName[132]="hoteling.groupNumber"
    cdrFieldName[133]="diversionInhibitor.invocationTime"
    cdrFieldName[134]="diversionInhibitor.facResult"
    cdrFieldName[135]="trunkGroupName"
    cdrFieldName[136]="spare"
    cdrFieldName[137]="instantGroupCall.invocationTime"
    cdrFieldName[138]="instantGroupCall.pushToTalk"
    cdrFieldName[139]="instantGroupCall.relatedCallId"
    cdrFieldName[140]="customRingback.invocationTime"
    cdrFieldName[141]="clidPermitted"
    cdrFieldName[142]="automaticHoldRetrieve.invocationTime"
    cdrFieldName[143]="automaticHoldRetrieve.action"
    cdrFieldName[144]="accessNetworkInfo"
    cdrFieldName[145]="chargingFunctionAddresses"
    cdrFieldName[146]="chargeNumber"
    cdrFieldName[147]="relatedCallId"
    cdrFieldName[148]="relatedCallIdReason"
    cdrFieldName[149]="transfer.invocationTime"
    cdrFieldName[150]="transfer.result"
    cdrFieldName[151]="transfer.relatedCallId"
    cdrFieldName[152]="transfer.type"
    cdrFieldName[153]="conference.startTime"
    cdrFieldName[154]="conference.stopTime"
    cdrFieldName[155]="conference.confId"
    cdrFieldName[156]="conference.type"
    cdrFieldName[157]="codecUsage"
    cdrFieldName[158]="vmBusyActivation.invocationTime"
    cdrFieldName[159]="vmBusyActivation.facResult"
    cdrFieldName[160]="vmBusyDeactivation.invocationTime"
    cdrFieldName[161]="vmBusyDeactivation.facResult"
    cdrFieldName[162]="vmNoAnswerActivation.invocationTime"
    cdrFieldName[163]="vmNoAnswerActivation.facResult"
    cdrFieldName[164]="vmNoAnswerDeactivation.invocationTime"
    cdrFieldName[165]="vmNoAnswerDeactivation.facResult"
    cdrFieldName[166]="vmAlwaysActivation.invocationTime"
    cdrFieldName[167]="vmAlwaysActivation.facResult"
    cdrFieldName[168]="vmAlwaysDeactivation.invocationTime"
    cdrFieldName[169]="vmAlwaysDeactivation.facResult"
    cdrFieldName[170]="noAnswerTimerSet.invocationTime"
    cdrFieldName[171]="noAnswerTimerSet.facResult"
    cdrFieldName[172]="clidBlockingActivation.invocationTime"
    cdrFieldName[173]="clidBlockingActivation.facResult"
    cdrFieldName[174]="clidBlockingDeactivation.invocationTime"
    cdrFieldName[175]="clidBlockingDeactivation.facResult"
    cdrFieldName[176]="callWaitingActivation.invocationTime"
    cdrFieldName[177]="callWaitingActivation.facResult"
    cdrFieldName[178]="callWaitingDeactivation.invocationTime"
    cdrFieldName[179]="callWaitingDeactivation.facResult"
    cdrFieldName[180]="faxMessaging"
    cdrFieldName[181]="twoStageDialingDigits"
    cdrFieldName[182]="trunkGroupInfo"
    cdrFieldName[183]="recallType"
    cdrFieldName[184]="cfnrcActivation.invocationTime"
    cdrFieldName[185]="cfnrcActivation.facResult"
    cdrFieldName[186]="cfnrcDeactivation.invocationTime"
    cdrFieldName[187]="cfnrcDeactivation.facResult"
    cdrFieldName[188]="q850Cause"
    cdrFieldName[189]="dialedDigitsContext"
    cdrFieldName[190]="calledNumberContext"
    cdrFieldName[191]="networkTranslatedNumberContext"
    cdrFieldName[192]="callingNumberContext"
    cdrFieldName[193]="originalCalledNumberContext"
    cdrFieldName[194]="redirectingNumberContext"
    cdrFieldName[195]="locationControl.locationActivationResult"
    cdrFieldName[196]="locationControl.locationDeactivationResult"
    cdrFieldName[197]="callRetrieve.callRetrieveResult"
    cdrFieldName[198]="routingNumber"
    cdrFieldName[199]="originationMethod"
    cdrFieldName[200]="callParked.invocationTime"
    cdrFieldName[201]="broadworksAnywhere.relatedCallId"
    cdrFieldName[202]="acrActivation.invocationTime"
    cdrFieldName[203]="acrActivation.facResult"
    cdrFieldName[204]="acrDeactivation.invocationTime"
    cdrFieldName[205]="acrDeactivation.facResult"
    cdrFieldName[206]="outsideAccessCode"
    cdrFieldName[207]="primaryDeviceLinePort"
    cdrFieldName[208]="calledAssertedIdentity"
    cdrFieldName[209]="calledAssertedPresentationIndicator"
    cdrFieldName[210]="sdp"
    cdrFieldName[211]="mediaInitiatorFlag"
    cdrFieldName[212]="sdpOfferTimestamp"
    cdrFieldName[213]="sdpAnswerTimestamp"
    cdrFieldName[214]="earlyMediaSdp"
    cdrFieldName[215]="earlyMediaInitiatorFlag"
    cdrFieldName[216]="bodyContentType"
    cdrFieldName[217]="bodyContentLength"
    cdrFieldName[218]="bodyContentDisposition"
    cdrFieldName[219]="bodyOriginator"
    cdrFieldName[220]="sipErrorCode"
    cdrFieldName[221]="otherInfoInPCV"
    cdrFieldName[222]="receivedCallingNumber"
    cdrFieldName[223]="customRingback.mediaSelection"
    cdrFieldName[224]="adviceOfCharge.aocType"
    cdrFieldName[225]="adviceOfCharge.charge"
    cdrFieldName[226]="adviceOfCharge.currency"
    cdrFieldName[227]="adviceOfCharge.time"
    cdrFieldName[228]="adviceOfCharge.sum"
    cdrFieldName[229]="adviceOfCharge.invocationTime"
    cdrFieldName[230]="adviceOfCharge.result"
    cdrFieldName[231]="asCallType"
    cdrFieldName[232]="scfActivation.invocationTime"
    cdrFieldName[233]="scfActivation.facResult"
    cdrFieldName[234]="scfDeactivation.invocationTime"
    cdrFieldName[235]="scfDeactivation.facResult"
    cdrFieldName[236]="cfaInterrogation.invocationTime"
    cdrFieldName[237]="cfaInterrogation.facResult"
    cdrFieldName[238]="cfnaInterrogation.invocationTime"
    cdrFieldName[239]="cfnaInterrogation.facResult"
    cdrFieldName[240]="cfbInterrogation.invocationTime"
    cdrFieldName[241]="cfbInterrogation.facResult"
    cdrFieldName[242]="cbfAuthorizationCode"
    cdrFieldName[243]="callBridge.callBridgeResult"
    cdrFieldName[244]="returnCallNumberDeletion.invocationTime"
    cdrFieldName[245]="returnCallNumDel.facResult"
    cdrFieldName[246]="prepaidStatus"
    cdrFieldName[247]="configurableCLID"
    cdrFieldName[248]="callCenter.nightServiceActivationMOResult"
    cdrFieldName[249]="callCenter.nightServiceDeactivationMOResult"
    cdrFieldName[250]="callCenter.forcedForwardingActivationResult"
    cdrFieldName[251]="callCenter.forcedForwardingDeactivationResult"
    cdrFieldName[252]="callCenter.outgoingCallCenterCallFACResult"
    cdrFieldName[253]="callCenter.outgoingPersonalCallFACResult"
    cdrFieldName[254]="callCenter.outgoingCallCenterPhoneNumber"
    cdrFieldName[255]="interceptUser.routingNumber"
    cdrFieldName[256]="interceptGroup.routingNumber"
    cdrFieldName[257]="cbActivation.invocationTime"
    cdrFieldName[258]="cbActivation.facResult"
    cdrFieldName[259]="cbDeactivation.invocationTime"
    cdrFieldName[260]="cbDeactivation.facResult"
    cdrFieldName[261]="cbQuery.invocationTime"
    cdrFieldName[262]="cbQuery.facResult"
    cdrFieldName[263]="cfnrcInterrogation.invocationTime"
    cdrFieldName[264]="cfnrcInterrogation.facResult"
    cdrFieldName[265]="vmrDialing.invocationTime"
    cdrFieldName[266]="vmrDialing.facResult"
    cdrFieldName[267]="vpDialing.invocationTime"
    cdrFieldName[268]="vpDialing.facResult"
    cdrFieldName[269]="pCamelLocInfo"
    cdrFieldName[270]="pCamelMscAddress"
    cdrFieldName[271]="pCamelCellIDorLAI"
    cdrFieldName[272]="namePermitted"
    cdrFieldName[273]="callCenter.outgoingCallCenterUserId"
    cdrFieldName[274]="callCenter.outgoingCallCenterGroupNumber"
    cdrFieldName[275]="virtualOnNetType"
    cdrFieldName[276]="preAlertingAnnouncement.preAlertingDuration"
    cdrFieldName[277]="ccDispositionCodeTagging.invocationTime"
    cdrFieldName[278]="ccDispositionCodeTagging.result"
    cdrFieldName[279]="ccEscalatedCall.invocationTime"
    cdrFieldName[280]="ccEscalatedCall.facResult"
    cdrFieldName[281]="ccMonitoringBI.invocationTime"
    cdrFieldName[282]="ccMonitoringBI.facResult"
    cdrFieldName[283]="midCallCustomerOriginatedTrace.invocationTime"
    cdrFieldName[284]="officeZone"
    cdrFieldName[285]="primaryZone"
    cdrFieldName[286]="roamingMscAddress"
    cdrFieldName[287]="ccEmergencyCall.invocationTime"
    cdrFieldName[288]="monitoringNextCall.invocationTime"
    cdrFieldName[289]="monitoringNextCall.facResult"
    cdrFieldName[290]="legacyAcbActivation.invocationTime"
    cdrFieldName[291]="legacyAcbActivation.facResult"
    cdrFieldName[292]="legacyAcbDeactivation.invocationTime"
    cdrFieldName[293]="legacyAcbDeactivation.facResult"
    cdrFieldName[294]="customSchemaVersion"
    cdrFieldName[295]="groupPaging.invocationTime"
    cdrFieldName[296]="groupPaging.relatedCallId"
    cdrFieldName[297]="dialableCallingNumber"
    cdrFieldName[298]="meetmeConference.invocationTime"
    cdrFieldName[299]="callMeNow.type"
    cdrFieldName[300]="callMeNow.transactionId"
    cdrFieldName[301]="callMeNow.relatedCallId"
    cdrFieldName[302]="meetmeConference.conferenceId"
    cdrFieldName[303]="meetmeConference.role"
    cdrFieldName[304]="meetmeConference.bridge"
    cdrFieldName[305]="meetmeConference.owner"
    cdrFieldName[306]="meetmeConference.ownerDN"
    cdrFieldName[307]="meetmeConference.title"
    cdrFieldName[308]="meetmeConference.projectCode"
    cdrFieldName[309]="meetmeConference.recordingDuration"
    cdrFieldName[310]="broadworksMobility.mobilityNumber"
    cdrFieldName[311]="broadworksMobility.mobilityRoutingNumber"
    cdrFieldName[312]="location"
    cdrFieldName[313]="locationType"
    cdrFieldName[314]="locationUsage"
    cdrFieldName[315]="callRecording.invocationTime"
    cdrFieldName[316]="callRecording.facResult"
    cdrFieldName[317]="callRecording.recordingTrigger"
    cdrFieldName[318]="callRecording.recordingDestination"
    cdrFieldName[319]="callRecording.recordingResult"
    cdrFieldName[320]="callingPresentationNumber"
    cdrFieldName[321]="callingPresentationNumberContext"
    cdrFieldName[322]="callingAssertedNumber"
    cdrFieldName[323]="callingAssertedNumberContext"
    cdrFieldName[324]="scc.invocationTime"
    cdrFieldName[325]="scc.sccCallId"
    cdrFieldName[326]="scc.sccNumber"
    cdrFieldName[327]="acrInterrogation.invocationTime"
    cdrFieldName[328]="acrInterrogation.facResult"
    cdrFieldName[329]="cwInterrogation.invocationTime"
    cdrFieldName[330]="cwInterrogation.facResult"
    cdrFieldName[331]="clidBlockingInterrogation.invocationTime"
    cdrFieldName[332]="clidBlockingInterrogation.facResult"
    cdrFieldName[333]="colrInterrogation.invocationTime"
    cdrFieldName[334]="colrInterrogation.facResult"
    cdrFieldName[335]="scrInterrogation.invocationTime"
    cdrFieldName[336]="scrInterrogation.facResult"
    cdrFieldName[337]="huntGroupBusyActivation.invocationTime"
    cdrFieldName[338]="huntGroupBusyActivation.facResult"
    cdrFieldName[339]="huntGroupBusyActivation.targetHuntGroupId"
    cdrFieldName[340]="huntGroupBusyDeactivation.invocationTime"
    cdrFieldName[341]="huntGroupBusyDeactivation.facResult"
    cdrFieldName[342]="huntGroupBusyDeactivation.targetHuntGroupId"
    cdrFieldName[343]="huntGroupBusyInterrogation.invocationTime"
    cdrFieldName[344]="huntGroupBusyInterrogation.facResult"
    cdrFieldName[345]="huntGroupBusyInterrogation.targetHuntGroupId"
    cdrFieldName[346]="userAgent"
    cdrFieldName[347]="fmfmCallPush.invocationTime"
    cdrFieldName[348]="fmfmCallPush.facResult"
    cdrFieldName[349]="scc.sccCause"
    cdrFieldName[350]="executiveAssistantInitiateCall.invocationTime"
    cdrFieldName[351]="executiveAssistantInitiateCall.facResult"
    cdrFieldName[352]="executiveAssistantCallPush.invocationTime"
    cdrFieldName[353]="executiveAssistantCallPush.facResult"
    cdrFieldName[354]="executiveCallFilteringActivation.invocationTime"
    cdrFieldName[355]="executiveCallFilteringActivation.facResult"
    cdrFieldName[356]="executiveCallFilteringDeactivation.invocationTime"
    cdrFieldName[357]="executiveCallFilteringDeactivation.facResult"
    cdrFieldName[358]="executiveAssistantOptIn.invocationTime"
    cdrFieldName[359]="executiveAssistantOptIn.facResult"
    cdrFieldName[360]="executiveAssistantOptOut.invocationTime"
    cdrFieldName[361]="executiveAssistantOptOut.facResult"
    cdrFieldName[362]="cicInsertedAsCac"
    cdrFieldName[363]="callingPartyAddress"
    cdrFieldName[364]="callRecordingStart.invocationTime"
    cdrFieldName[365]="callRecordingStart.facResult"
    cdrFieldName[366]="callRecordingStop.invocationTime"
    cdrFieldName[367]="callRecordingStop.facResult"
    cdrFieldName[368]="callRecordingPause.invocationTime"
    cdrFieldName[369]="callRecordingPause.facResult"
    cdrFieldName[370]="callRecordingResume.invocationTime"
    cdrFieldName[371]="callRecordingResume.facResult"
    cdrFieldName[372]="extTrackingId"
    cdrFieldName[373]="flexibleSeatingGuest.invocationTime"
    cdrFieldName[374]="flexibleSeatingGuest.hostGroup"
    cdrFieldName[375]="flexibleSeatingGuest.hostUserId"
    cdrFieldName[376]="flexibleSeatingGuest.hostUserNumber"
    cdrFieldName[377]="flexibleSeatingGuest.hostGroupNumber"
    cdrFieldName[378]="gets"
    cdrFieldName[379]="numberPortability.npdi"
    cdrFieldName[380]="numberPortability.rn"
    cdrFieldName[381]="numberPortability.status"
    cdrFieldName[382]="numberPortabilityAnnouncementActivation.invocationTime"
    cdrFieldName[383]="numberPortabilityAnnouncementActivation.facResult"
    cdrFieldName[384]="numberPortabilityAnnouncementDeactivation.invocationTime"
    cdrFieldName[385]="numberPortabilityAnnouncementDeactivation.facResult"
    cdrFieldName[386]="calledPartyAddress"
    cdrFieldName[387]="mobilityCallAnchoringActivation.invocationTime"
    cdrFieldName[388]="mobilityCallAnchoringActivation.facResult"
    cdrFieldName[389]="mobilityCallAnchoringDeactivation.invocationTime"
    cdrFieldName[390]="mobilityCallAnchoringDeactivation.facResult"
    cdrFieldName[391]="mobilityCallAnchoringActivationPerCall.invocationTime"
    cdrFieldName[392]="mobilityCallAnchoringActivationPerCall.facResult"
    cdrFieldName[393]="mobilityCallingLineIDActivation.invocationTime"
    cdrFieldName[394]="mobilityCallingLineIDActivation.facResult"
    cdrFieldName[395]="mobilityCallingLineIDDeactivation.invocationTime"
    cdrFieldName[396]="mobilityCallingLineIDDeactivation.facResult"
    cdrFieldName[397]="mobilityCallingLineIDActivationPerCall.invocationTime"
    cdrFieldName[398]="mobilityCallingLineIDActivationPerCall.facResult"
    cdrFieldName[399]="mobilityCallingLineIDDeactivationPerCall.invocationTime"
    cdrFieldName[400]="mobilityCallingLineIDDeactivationPerCall.facResult"
    cdrFieldName[401]="personalAssistant.presence"
    cdrFieldName[402]="answerConfirmationInvocationTime"
    cdrFieldName[403]="answerConfirmationTime"
    cdrFieldName[404]="routeList.routeListNumber"
    cdrFieldName[405]="collaborate.invocationTime"
    cdrFieldName[406]="collaborate.roomID"
    cdrFieldName[407]="collaborate.role"
    cdrFieldName[408]="collaborate.bridge"
    cdrFieldName[409]="collaborate.owner"
    cdrFieldName[410]="collaborate.ownerDN"
    cdrFieldName[411]="collaborate.roomName"
    cdrFieldName[412]="collaborate.roomType"
    cdrFieldName[413]="btluExceeded"
    cdrFieldName[414]="enterpriseTrunkCapacityExceeded"
    cdrFieldName[415]="customInfoInPCV"
    cdrFieldName[416]="receivedRoute"
    cdrFieldName[417]="alternateCarrierSelection.selectScheme"
    cdrFieldName[418]="receivedChargingVector"
    cdrFieldName[419]="phoneListCallingName"
    cdrFieldName[420]="receivedTimeZone"
    cdrFieldName[421]="userEquipmentInfo"
    cdrFieldName[422]="chargingGroupId"
    cdrFieldName[423]="incomingReason"
    cdrFieldName[424]="outgoingReason"
    cdrFieldName[425]="requestedPartyAddress"
    cdrFieldName[426]="privateUserIdentity"
    cdrFieldName[427]="musicOnHold.invocationTime"
    cdrFieldName[428]="locationNetwork"
    cdrFieldName[429]="e911PsapCallbackAttempt"
    cdrFieldName[430]="accessNetworkInfoFromRegister"
    cdrFieldName[431]="directRoute.directRouteNumber"
    cdrFieldName[432]="imrnFromXsi"
    cdrFieldName[433]="outgoingPrivacy"
    cdrFieldName[434]="pushNotificationRetrieve.invocationTime"
    cdrFieldName[435]="pushNotificationRetrieve.facResult"
    cdrFieldName[436]="scc.mscIdentity"
    cdrFieldName[437]="callParked.parkedAgainst"
    cdrFieldName[438]="callParkRetrieve.retrievedAgainst"
    cdrFieldName[439]="callPickup.pickedUpUser"
    cdrFieldName[440]="directedCallPickup.pickedUpUser"
    cdrFieldName[441]="directedCPUBargeIn.bargedInUser"
    cdrFieldName[442]="outgoingTrunkGroup"
    cdrFieldName[443]="getsOriginationType"
    cdrFieldName[444]="getsPriorityLevel"
    cdrFieldName[445]="scc.cellIdentity"
    cdrFieldName[446]="scc.sectorIdentity"
    cdrFieldName[447]="receivedCalledAssertedIdentity"
    cdrFieldName[448]="reseller"
    cdrFieldName[449]="imsi"
    cdrFieldName[450]="callReferenceNumber"
    cdrFieldName[451]="vlrNumber"
    cdrFieldName[452]="automaticCollectCall.callType"
    cdrFieldName[453]="automaticCollectCall.connectTime"
    cdrFieldName[454]="terminatingClosedUserGroup.invocationTime"
    cdrFieldName[455]="terminatingClosedUserGroup.result"
    cdrFieldName[456]="userType"
    cdrFieldName[457]="ccCoachingBI.invocationTime"
    cdrFieldName[458]="ccCoachingBI.facResult"
    cdrFieldName[459]="groupName"
    cdrFieldName[460]="userExternalId"
    cdrFieldName[461]="serviceProviderExternalId"
    cdrFieldName[462]="resellerExternalId"
    cdrFieldName[463]="localGatewayBreakoutIndicator"
    cdrFieldName[464]="btluBursting"
    cdrFieldName[465]="stirShaken.verstat"
}
