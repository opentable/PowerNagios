$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Build-NagiosCommand" {
    
    Context "When trying to disable all notifications for a hostgroup" { 
        $nagiosCommand = Build-NagiosCommand "TestUser" "TestPwd" "Api-Checks" "HostGroup" "192.168.201.90" "66"

        It "Should return the correct command" {
            $nagiosCommand.should.be('curl -d "cmd_typ=66&cmd_mod=2&HostGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a hostname" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=66&host=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a servicegroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=66&cmd_mod=2&ServiceGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should have a cmdtyp that represents 66" {
            $nagiosCommand.should.match("cmd_typ=66")
        }

        It "Should have a HostGroup of Api-Checks" {
            $nagiosCommand.should.match("HostGroup=Api-Checks")
        }
    }

    Context "When trying to enable all notifications for a hostgroup" { 
        $nagiosCommand = Build-NagiosCommand "TestUser" "TestPwd" "Api-Checks" "HostGroup" "192.168.201.90" "65"

        It "Should return the correct command" {
            $nagiosCommand.should.be('curl -d "cmd_typ=65&cmd_mod=2&HostGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a hostname" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=65&host=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a servicegroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=65&cmd_mod=2&ServiceGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should have a cmdtyp that represents 65" {
            $nagiosCommand.should.match("cmd_typ=65")
        }

        It "Should have a HostGroup of Api-Checks" {
            $nagiosCommand.should.match("HostGroup=Api-Checks")
        }
    }

    Context "When trying to disable all notifications for a servicegroup" { 
        $nagiosCommand = Build-NagiosCommand "TestUser" "TestPwd" "Api-Checks" "ServiceGroup" "192.168.201.90" "112"

        It "Should return the correct command" {
            $nagiosCommand.should.be('curl -d "cmd_typ=112&cmd_mod=2&ServiceGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a hostname" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=112&host=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a hostgroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=112&cmd_mod=2&HostGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should have a cmdtyp that represents 112" {
            $nagiosCommand.should.match("cmd_typ=112")
        }

        It "Should have a ServiceGroup of Api-Checks" {
            $nagiosCommand.should.match("ServiceGroup=Api-Checks")
        }
        
    }

    Context "When trying to enable all notifications for a servicegroup" { 
        $nagiosCommand = Build-NagiosCommand "TestUser" "TestPwd" "Api-Checks" "ServiceGroup" "192.168.201.90" "111"

        It "Should return the correct command" {
            $nagiosCommand.should.be('curl -d "cmd_typ=111&cmd_mod=2&ServiceGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a hostname" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=111&host=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a hostgroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=111&cmd_mod=2&HostGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should have a cmdtyp that represents 111" {
            $nagiosCommand.should.match("cmd_typ=111")
        }

        It "Should have a ServiceGroup of Api-Checks" {
            $nagiosCommand.should.match("ServiceGroup=Api-Checks")
        }
    }

    Context "When trying to disable all notifications for a host" { 
        $nagiosCommand = Build-NagiosCommand "TestUser" "TestPwd" "my-box-01" "host" "192.168.201.90" "25"

        It "Should return the correct command" {
            $nagiosCommand.should.be('curl -d "cmd_typ=25&host=my-box-01&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a HostGroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=25&cmd_mod=2&HostGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a ServiceGroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=25&cmd_mod=2&ServiceGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should have a cmdtyp that represents 25" {
            $nagiosCommand.should.match("cmd_typ=25")
        }

        It "Should have a Host of my-box-01" {
            $nagiosCommand.should.match("host=my-box-01")
        }
    }

    Context "When trying to enable all notifications for a host" { 
        $nagiosCommand = Build-NagiosCommand "TestUser" "TestPwd" "my-box-01" "host" "192.168.201.90" "24"

        It "Should return the correct command" {
            $nagiosCommand.should.be('curl -d "cmd_typ=24&host=my-box-01&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a HostGroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=24&cmd_mod=2&HostGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should not be a command that includes a ServiceGroup" {
            $nagiosCommand.should.not_be('curl -d "cmd_typ=24&cmd_mod=2&ServiceGroup=Api-Checks&bntSubmit=Commit" -k "https://TestUser:TestPwd@192.168.201.90/nagios/cgi-bin/cmd.cgi"')
        }

        It "Should have a cmdtyp that represents 24" {
            $nagiosCommand.should.match("cmd_typ=24")
        }

        It "Should have a Host of my-box-01" {
            $nagiosCommand.should.match("host=my-box-01")
        }
    }

}