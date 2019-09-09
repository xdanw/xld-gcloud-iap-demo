<#if deployed.container.clientPath?has_content> 
  <#assign clientPath = "${deployed.container.clientPath}" + "/">
<#else>
  <#assign clientPath = "">
</#if>

kill %'${clientPath}gcloud compute start-iap-tunnel ${deployed.container.gcpInstanceName} ${deployed.container.targetPort}'