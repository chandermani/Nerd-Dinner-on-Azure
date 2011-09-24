<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="NerdDinner.Cloud" generation="1" functional="0" release="0" Id="6688e749-296a-4460-bb04-9ab33c2acce5" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="NerdDinner.CloudGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="NerdDinner:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/LB:NerdDinner:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="NerdDinner:?IsSimulationEnvironment?" defaultValue="">
          <maps>
            <mapMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/MapNerdDinner:?IsSimulationEnvironment?" />
          </maps>
        </aCS>
        <aCS name="NerdDinner:?RoleHostDebugger?" defaultValue="">
          <maps>
            <mapMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/MapNerdDinner:?RoleHostDebugger?" />
          </maps>
        </aCS>
        <aCS name="NerdDinner:?StartupTaskDebugger?" defaultValue="">
          <maps>
            <mapMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/MapNerdDinner:?StartupTaskDebugger?" />
          </maps>
        </aCS>
        <aCS name="NerdDinner:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/MapNerdDinner:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="NerdDinnerInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/MapNerdDinnerInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:NerdDinner:Endpoint1">
          <toPorts>
            <inPortMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinner/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapNerdDinner:?IsSimulationEnvironment?" kind="Identity">
          <setting>
            <aCSMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinner/?IsSimulationEnvironment?" />
          </setting>
        </map>
        <map name="MapNerdDinner:?RoleHostDebugger?" kind="Identity">
          <setting>
            <aCSMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinner/?RoleHostDebugger?" />
          </setting>
        </map>
        <map name="MapNerdDinner:?StartupTaskDebugger?" kind="Identity">
          <setting>
            <aCSMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinner/?StartupTaskDebugger?" />
          </setting>
        </map>
        <map name="MapNerdDinner:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinner/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapNerdDinnerInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinnerInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="NerdDinner" generation="1" functional="0" release="0" software="J:\AzureDojo\Work\Final\NerdDinner.Cloud\bin\Debug\NerdDinner.Cloud.csx\roles\NerdDinner" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="?IsSimulationEnvironment?" defaultValue="" />
              <aCS name="?RoleHostDebugger?" defaultValue="" />
              <aCS name="?StartupTaskDebugger?" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;NerdDinner&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;NerdDinner&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinnerInstances" />
            <sCSPolicyFaultDomainMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinnerFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="NerdDinnerFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="NerdDinnerInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="ef5e3859-73f6-4268-9366-5e31ae409e48" ref="Microsoft.RedDog.Contract\ServiceContract\NerdDinner.CloudContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="12e3da74-6733-4d85-902b-008665b7bd79" ref="Microsoft.RedDog.Contract\Interface\NerdDinner:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/NerdDinner.Cloud/NerdDinner.CloudGroup/NerdDinner:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>