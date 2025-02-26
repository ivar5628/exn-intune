$RegPath = "HKLM:\SOFTWARE\Microsoft\Enrollments\Status"
$EnrollmentStatus = Get-ItemProperty -Path $RegPath -Name "Enrolled" -ErrorAction SilentlyContinue

if ($EnrollmentStatus -eq $null -or $EnrollmentStatus.Enrolled -ne 1) {
    Write-Host "Starting Intune enrollment..."
    Start-Process -FilePath "C:\Windows\System32\DeviceEnroller.exe" -ArgumentList "/c /AutoEnrollMDM" -Wait
} else {
    Write-Host "Device is already enrolled."
}
