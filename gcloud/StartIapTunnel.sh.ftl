
<#if deployed.container.clientPath?has_content> 
  <#assign clientPath = "${deployed.container.clientPath}" + "/">
<#else>
  <#assign clientPath = "">
</#if>

<#if deployed.container.gcpZone?has_content>
<#-- zone is defined -->
${clientPath}gcloud auth activate-service-account --key-file=${deployed.container.gcpKeyfile}
${clientPath}gcloud compute start-iap-tunnel ${deployed.container.gcpInstanceName} ${deployed.container.targetPort} --project=${deployed.container.gcpProject} --zone=${deployed.container.gcpZone} --local-host-port=localhost:${deployed.container.localPort} --no-user-output-enabled &
<#else>
<#-- zone is not defined, gcloud will try to guess but will stop if ambiguous -->
${clientPath}gcloud auth activate-service-account --key-file=${deployed.container.gcpKeyfile}
${clientPath}gcloud compute start-iap-tunnel ${deployed.container.gcpInstanceName} ${deployed.container.targetPort} --project=${deployed.container.gcpProject} --local-host-port=localhost:${deployed.container.localPort} --no-user-output-enabled &
</#if>
