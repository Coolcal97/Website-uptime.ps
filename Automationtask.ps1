$trigger = New-Scheduledtasktrigger -At 7pm -daily
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument '-File "C:\pc\Techstridenet.ps1"'
$settings = New-ScheduledTaskSettingsSet
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Test Space" -Description "Tests connection with techstride.com" -Settings $settings