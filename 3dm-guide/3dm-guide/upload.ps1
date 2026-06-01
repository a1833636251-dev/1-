Add-Type -AssemblyName System.Net.Http
$client = New-Object System.Net.Http.HttpClient
$content = New-Object System.Net.Http.ByteArrayContent([System.IO.File]::ReadAllBytes("C:\Users\Lenovo\3dm-guide\index.html"))
$form = New-Object System.Net.Http.MultipartFormDataContent
$form.Add($content, "file", "index.html")
$response = $client.PostAsync("https://catbox.moe/user/api.php", $form).Result
Write-Output $response.Content.ReadAsStringAsync().Result