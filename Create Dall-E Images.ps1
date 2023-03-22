# Create Dall-E Images

$Prompt = Read-Host "Describe the image you want"
$Images = 3

# To create encyrpted key (only accessible by same user on same computer): Read-Host 'Enter Password' -AsSecureString  | ConvertFrom-SecureString
# Get API Key from: https://platform.openai.com/account/api-keys
$EncryptedKey = '01000000d08c9ddf0115d111111110c04fc297eb01000000375c94d2507af949b580b30db9220c630000000002000000000003660000c0000000100000007960111110bc941645af55178dbdfd870000000004800000a0000000100000005092a23a11111b00ed569744ef59119d680000005875d457ea6111c4eb2319ca11111e4937cde961aa6da0fb5645069a87cb4b7618147f92543c5f7339b1540168394939f241a86b3c2d1272d22109083b1fe7918b524b'
$KeySecure = ConvertTo-SecureString -String $EncryptedKey
$ApiKey = (New-Object System.Net.NetworkCredential("", $KeySecure)).Password

Write-Host "Generating - $Prompt..."
$Url = 'https://api.openai.com/v1/images/generations'
$Body = [pscustomobject]@{
    "prompt" = $Prompt
    "n"      = $Images
    "size"   = "1024x1024"
}
$Header = @{
    "Authorization" = "Bearer $ApiKey"
    "Content-Type"  = "application/json"
}
$BodyJSON = ($Body | ConvertTo-Json -Compress)
$Response = Invoke-WebRequest -Uri $Url -Headers $Header -Body $BodyJSON -Method Post

$Output = ($Response.Content | ConvertFrom-Json).Data
Return $Output | FL

$Output | ForEach-Object {Start-Process $_} # Open URLs in Browser
