param(
    [Parameter(
            Mandatory=$true,
            HelpMessage="Username of a nagios user (this must include domain where appropriate)")]
    [string]$CURL_USER,      

    [Parameter(
            Mandatory=$true,
            HelpMessage="Password associated with that user")]
    [string]$CURL_USER_PASSWORD,
    
    [Parameter(
            Mandatory=$true,
            HelpMessage="Name of the Nagios Group you want to disable notifications for (e.g.api-checks)")]
    [string]$GROUP_NAME,

    [Parameter(
            Mandatory=$true,
            HelpMessage="Type of the group you want to interact with (e.g. ServiceGroup, HostGroup etc.")]
    [string]$GROUP_TYPE,
    
    [Parameter(
            Mandatory=$true,
            HelpMessage="The url or ip direct to the nagios host (please exclude /nagios/cgi-bin etc.)")]
    [string]$NAGIOS_WEB_DOMAIN,

    [Parameter(
            Mandatory=$true,
            HelpMessage="The command you want to run agains thte Nagios Host Group (e.g. 65 to enable notifications)")]
    [string]$NAGIOS_COMMAND
)

. ".\functions\nagios-commands.ps1"
$nagiosCommand = Build-NagiosCommand $CURL_USER $CURL_USER_PASSWORD $GROUP_NAME $GROUP_TYPE $NAGIOS_WEB_DOMAIN $NAGIOS_COMMAND

try {
    $result = invoke-expression $nagiosCommand
    if ($result[30].Contains("Your command request was successfully submitted to Nagios for processing")) {
        Write-Host('Nagios Command successfully placed')
    }
    else {
        Write-Warning('We could not place your command with Nagios. Please proceed manaully before deployment')
    }
}
catch {
    Write-Error('Please manually disable/enable notificiations via Nagios GUI before continuing the deployment')
    Write-Host $_
}