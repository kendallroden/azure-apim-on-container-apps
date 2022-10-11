param location string
param apiManagementName string
param selfHostedGatewayName string
param publisherEmail string 

// API Management Instance
resource apiManagement 'Microsoft.ApiManagement/service@2021-08-01' = {
  name: apiManagementName
  location: location
  sku: {
    name: 'Developer'
    capacity: 1
  }
  properties: {
    publisherName: 'Contoso'
    publisherEmail: publisherEmail
  }
}

// Gateway
resource selfHostedGateway 'Microsoft.ApiManagement/service/gateways@2021-08-01' = {
  name: selfHostedGatewayName
  parent: apiManagement
  properties:{
    description: 'Self-hosted API Gateway on Azure Container Apps'
    locationData: {
      name: 'Azure Container Apps'
      countryOrRegion: 'Cloud'
    }
  }
}

output apiManagementName string = apiManagement.name
