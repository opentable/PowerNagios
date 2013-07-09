PowerNagios
--
This is a PowerShell script that will allow you to enable / disable notifications for Hosts, HostGroups and Services on a Nagios system. This is currently used as part of a continuous delivery pipeline.

Examples
--
* To disable all notifications on a host

    .\nagios-interaction.ps1 -CURL_USER "TestUser" -CURL_USER_PASSWORD "MyPassword" -GROUP_NAME "MyHostGroup" -GROUP_TYPE "Host" -NAGIOS_WEB_DOMAIN "127.0.0.1" -NAGIOS_COMMAND "25"

* To enable all notifications on a host

    .\nagios-interaction.ps1 -CURL_USER "TestUser" -CURL_USER_PASSWORD "MyPassword" -GROUP_NAME "MyHostGroup" -GROUP_TYPE "Host" -NAGIOS_WEB_DOMAIN "127.0.0.1" -NAGIOS_COMMAND "24"

* To disable all notifications on a specific host group

    .\nagios-interaction.ps1 -CURL_USER "TestUser" -CURL_USER_PASSWORD "MyPassword" -GROUP_NAME "MyHostGroup" -GROUP_TYPE "HostGroup" -NAGIOS_WEB_DOMAIN "127.0.0.1" -NAGIOS_COMMAND "66"

* To enable all notifications on a specific host group

    .\nagios-interaction.ps1 -CURL_USER "TestUser" -CURL_USER_PASSWORD "MyPassword" -GROUP_NAME "MyHostGroup" -GROUP_TYPE "HostGroup" -NAGIOS_WEB_DOMAIN "127.0.0.1" -NAGIOS_COMMAND "65"

* To disable all notifications on a specific service group

    .\nagios-interaction.ps1 -CURL_USER "TestUser" -CURL_USER_PASSWORD "MyPassword" -GROUP_NAME "MyHostGroup" -GROUP_TYPE "ServiceGroup" -NAGIOS_WEB_DOMAIN "127.0.0.1" -NAGIOS_COMMAND "112"

* To enable all notifications on a specific service group

    .\nagios-interaction.ps1 -CURL_USER "TestUser" -CURL_USER_PASSWORD "MyPassword" -GROUP_NAME "MyHostGroup" -GROUP_TYPE "ServiceGroup" -NAGIOS_WEB_DOMAIN "127.0.0.1" -NAGIOS_COMMAND "111"

Tests
--
This script has a number of tests to ensure that the correct commands are built. If you want to run the tests, then:

* Go to the functions directory
* Open a PowerShell window
* Run the command 'Import-Module .\Pester\Pester.psm1'
* Then run 'Invoke-Pester'
* All tests in the current functions directory will run

Further Nagios Commands
--
For a full list of Nagios commands that can be invoked, please see their [documentation](http://old.nagios.org/developerinfo/externalcommands/commandlist.php")

