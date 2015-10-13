#tag Menu
Begin Menu ScintillaMenu
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem OpenFileMenu
         SpecialMenu = 0
         Text = "Open..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem NewDocumentItem
         SpecialMenu = 0
         Text = "New..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem SaveFileItem
         SpecialMenu = 0
         Text = "Save..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem SaveAsMenuItem
         SpecialMenu = 0
         Text = "Save as..."
         Index = -2147483648
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditRedo
         SpecialMenu = 0
         Text = "&Redo"
         Index = -2147483648
         ShortcutKey = "Y"
         Shortcut = "Cmd+Y"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem SearchItem
         SpecialMenu = 0
         Text = "Find..."
         Index = -2147483648
         ShortcutKey = "&F"
         Shortcut = "Cmd+&F"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
   End
   Begin MenuItem Viewmenu
      SpecialMenu = 0
      Text = "View"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem WordWrapItem
         SpecialMenu = 0
         Text = "Word wrap"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EOLMenu
         SpecialMenu = 0
         Text = "EOL"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem EOLVisibleItem
            SpecialMenu = 0
            Text = "Visible"
            Index = -2147483648
            AutoEnable = True
         End
         Begin MenuItem EOLConvertMenu
            SpecialMenu = 0
            Text = "Convert to"
            Index = -2147483648
            AutoEnable = True
            SubMenu = True
            Begin MenuItem EOLConvertToWin32
               SpecialMenu = 0
               Text = "Windows"
               Index = -2147483648
               AutoEnable = True
            End
            Begin MenuItem EOLConvertToLinux
               SpecialMenu = 0
               Text = "Linux"
               Index = -2147483648
               AutoEnable = True
            End
            Begin MenuItem EOLConvertToMac
               SpecialMenu = 0
               Text = "Mac"
               Index = -2147483648
               AutoEnable = True
            End
         End
      End
   End
End
#tag EndMenu
