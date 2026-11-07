#!/bin/bash
# ==============================================================================
# Script: test_connectivity.sh
# Purpose: Test Step 6 & 7 from the architecture diagram:
# 1. nslookup on Storage Blob FQDN to verify Private IP resolution (10.124.2.4)
# 2. Curl / Download test blob securely via Private Endpoint
# ==============================================================================

if [ -z "$1" ]; then
  echo "Usage: ./test_connectivity.sh <storage_account_name>"
  echo "Example: ./test_connectivity.sh distorageabcd12"
  exit 1
fi

STORAGE_NAME="$1"
BLOB_FQDN="${STORAGE_NAME}.blob.core.windows.net"

echo "=========================================================="
echo "🔍 STEP 7: Testing DNS Resolution for: ${BLOB_FQDN}"
echo "=========================================================="

# Run nslookup
nslookup "${BLOB_FQDN}"

echo ""
echo "=========================================================="
echo "📡 Checking IP Mapping: Expecting Private IP in 10.124.2.x subnet"
echo "=========================================================="

RESOLVED_IP=$(dig +short "${BLOB_FQDN}" | tail -n1)
echo "Resolved IP: ${RESOLVED_IP}"

if [[ "${RESOLVED_IP}" =~ ^10\.124\.2\. ]]; then
  echo "✅ SUCCESS! FQDN is successfully resolving to the Private Endpoint IP (${RESOLVED_IP})."
  echo "Private DNS Zone link is working across peered VNets!"
else
  echo "⚠️ Note: Resolved IP is ${RESOLVED_IP}. Check if Private DNS Zone is linked to this VNet."
fi

echo ""
echo "=========================================================="
echo "📦 Testing HTTP connectivity to Blob Storage..."
echo "=========================================================="
# Since public network access is disabled, curling without auth should return 400 Bad Request or 403 Forbidden with Microsoft-Azure-Storage header (proving private connectivity to storage engine)
curl -I "https://${BLOB_FQDN}/" --connect-timeout 5

echo "=========================================================="
