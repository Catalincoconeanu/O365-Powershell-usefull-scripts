﻿#View all shared mailboxes a user has access upon
#This script also export into a html file
# enter email address
$email = Read-host "Enter email address"
Get-Mailbox -RecipientTypeDetails UserMailbox,SharedMailbox -ResultSize Unlimited | Get-MailboxPermission -User $email | Select-Object -Property User,Identity,AccessRights | convertto-html -title "Shared Mailbox accesses" -body (get-date) -PreContent "This has been generated by IT Service Desk" | out-file C:\catamailboxes.html