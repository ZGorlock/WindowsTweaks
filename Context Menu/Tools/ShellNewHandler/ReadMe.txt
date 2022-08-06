ShellNewHandler 1.1.2 by einsundnull 2010

// ----------------------------------------

Tool to enable disable the New File entries 
in Windows Explorer ContextMenu. 
Primary designed for Windows Vista. Works
also on Windows 7. Should work on Windows XP too.

Motivation was the unsuccessful search for
a freeware tool to handle these entries,
without using TweakUI in legacy mode.

// ----------------------------------------

Simple check the items in ListView to enable
an context menu entry and uncheck to disable it.

NOTE:
The process requires to run the tool with
Administrator privileges on Windows Vista
and Windows 7.

// ----------------------------------------

Technical detail:
Disabeling is done by rename the ShellNew 
RegistryKey of the extensions to _ShellNew 
and enable does the reverse thing.