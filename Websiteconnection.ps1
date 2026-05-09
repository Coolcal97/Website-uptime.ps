$url = "https://www.techstride.com" 
$logPath = "C:\logs\Websitecheck.log"
$smtpServer = "smtp.yourdomain.com"
$from = "monitor@yourdomain.com"
$to = "it@yourdomain.com"
$subject = "Website Montior Alert" 

$timestamp = get-date -Format "yyyy-MM-dd HH:mm:ss"

try { $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 10
$status = "UP ($($response.Statuscode))" 
} catch { $status = "DOWN"}

"$timestamp - $status" | Out-File -FilePath $logPath -Append

if ($status -eq "DOWN") {
$body = "Alert: $url is DOWN as of $timestamp" 
Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body}