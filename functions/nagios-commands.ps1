function Build-NagiosCommand($user, $password, $nagios_group, $nagios_group_type, $ip, $command) {
    $nagiosCommand = [string]::Format("curl -d `"cmd_typ={0}&cmd_mod=2&{1}={2}&bntSubmit=Commit`" -k `"https://{3}:{4}@{5}/nagios/cgi-bin/cmd.cgi`"", $command, $nagios_group_type, $nagios_group, $user, $password, $ip)
    
    if($nagios_group_type -eq "host") {
        $nagiosCommand = $nagiosCommand.Replace("&cmd_mod=2","")
    }
    
    return $nagiosCommand
}