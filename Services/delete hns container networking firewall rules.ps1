Get-NetFirewallRule | Where {$_.Name -like "HNS Container Networking - DNS (UDP-In)*" } | Remove-NetFirewallRule
Get-NetFirewallRule | Where {$_.Name -like "HNS Container Networking - ICS DNS (TCP-In)*" } | Remove-NetFirewallRule


# https://answers.microsoft.com/en-us/windows/forum/all/when-is-microsoft-going-to-issue-a-fix-for-hns/ab54a12d-dc6c-44c2-a4d8-9c4a2df498a5
