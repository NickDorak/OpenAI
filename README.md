# OpenAI
PowerShell scripts to query to OpenAI using ChatGPT and Dall-E.

Chat with ChatGPT.ps1     - Interactive chat back and fourth with ChatGPT

Query ChatGPT.ps1         - Single Query to ChatGPT

Create Dall-E Images.ps1  - Generates images from Dall-E and provide links


## Never Store Secrets in Scripts
You should ***never*** store easily decrypted secrets in your script files. 

In the example scripts I have used a native PowerShell command to secure the API Key and then output it as an encypted string. This method only allows the user and computer who ran the command to derypt the data. This prevents the encrypted key from being decripted and used on other computers or by other users. You may have a better method like storing in external key vault, but for this testing it was the simplest method. 

To generate your own encypted API key, run the following PowerShell command and paste in your API key. You can take the output and use for the `$EncryptedKey` variable in the sample scripts. 

PS:\\> `Read-Host 'Enter Password' -AsSecureString  | ConvertFrom-SecureString`
